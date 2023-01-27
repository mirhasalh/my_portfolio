import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/src/page/pages.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/src/asset/icon_assets.dart';
import 'package:my_portfolio/src/model/project_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

const kGitRepoUrl = 'https://github.com/mirhasalh/my_portfolio';
const kDropboxUrl =
    'https://www.dropbox.com/sh/6c9e5v8pk1wx5r4/AACxASmgj5xSzi5yHhZy0GEZa?dl=0';

class ShowcasesPage extends StatefulWidget {
  const ShowcasesPage({super.key});

  @override
  State<ShowcasesPage> createState() => _ShowcasesPageState();
}

class _ShowcasesPageState extends State<ShowcasesPage> {
  late final Future<List<ProjectModel>> _projects = _getProjects();

  @override
  void initState() {
    super.initState();
    _getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          kToolbarHeight,
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AppBar(
              title: const Text('Showcases'),
              elevation: 0.0,
              backgroundColor: Colors.black87,
              actions: [
                IconButton(
                  tooltip: 'Download APK',
                  onPressed: () {
                    if (kIsWeb) {
                      html.window.open(
                        kDropboxUrl,
                        '_blank',
                      );

                      return;
                    }

                    _launchUrl(kDropboxUrl);
                  },
                  icon: const Icon(Icons.android),
                  splashRadius: 20.0,
                ),
                IconButton(
                  tooltip: 'GitHub',
                  onPressed: () {
                    if (kIsWeb) {
                      html.window.open(
                        kGitRepoUrl,
                        '_blank',
                      );

                      return;
                    }

                    _launchUrl(kGitRepoUrl);
                  },
                  splashRadius: 20.0,
                  icon: SvgPicture.asset(
                    IconAssets.github,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<ProjectModel>>(
        future: _projects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Failed to load"));
          } else {
            final proj = snapshot.data;
            return ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0 + kToolbarHeight,
                horizontal: 6.0,
              ),
              children: [
                StaggeredGrid.count(
                  crossAxisCount:
                      _getAxisCount(MediaQuery.of(context).size.width),
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                  children: List.generate(
                    proj!.length,
                    (index) => _Project(
                      id: '${proj[index].id}',
                      src: proj[index].image!,
                      title: proj[index].title!,
                      initialCommit: proj[index].init!,
                      projectStatus: proj[index].status!,
                      onTap: () {
                        var split =
                            Uri.parse(proj[index].image!).path.split('/');

                        final path2 = split.last;
                        final path = split[split.length - 2];

                        final location = context.namedLocation(
                          ViewImagePage.routeName,
                          params: {'path': path, 'path2': path2},
                        );

                        context.go(location);
                      },
                      onTapInfo: () => _showInfo(proj[index]),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<List<ProjectModel>> _getProjects() async {
    final res = await rootBundle.loadString("json/projects.json");

    final data = json.decode(res);

    return (data as List).map((e) => ProjectModel.fromJson(e)).toList();
  }

  int _getAxisCount(double width) {
    if (width >= 800) {
      return 4;
    } else if (width >= 600) {
      return 3;
    } else {
      return 2;
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.platformDefault,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ))) {
      throw 'Could not launch $url';
    }
  }

  void _showInfo(ProjectModel project) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      context: context,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _DragHandler(),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(project.desc!,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  'Description',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(project.title!),
            subtitle: const Text('Project title'),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(
                project.type == 2 ? 'Associated with company' : 'Personal'),
            subtitle: const Text('Type'),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(project.status!),
            subtitle: const Text('Status'),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(project.init!),
            subtitle: const Text('Initial commit'),
          ),
          const Divider(height: 0.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_techStackFormat(project.techStack!),
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  'Tech stack',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _techStackFormat(String text) {
    if (text == 'n/a') {
      return 'UI kit only';
    }

    var split = text.split(',');

    return split.join(', ');
  }
}

class _Project extends StatelessWidget {
  const _Project({
    required this.id,
    required this.src,
    required this.title,
    required this.initialCommit,
    required this.projectStatus,
    required this.onTap,
    required this.onTapInfo,
  });

  final String id;
  final String src;
  final String title;
  final String initialCommit;
  final String projectStatus;
  final VoidCallback onTap;
  final VoidCallback onTapInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: Hero(
                  tag: Uri.parse(src).path.replaceAll(RegExp(r'/'), ''),
                  child: kIsWeb
                      ? Image.network(src)
                      : FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: src,
                        ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onTapInfo,
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white70,
            ),
            tooltip: 'Info',
          ),
        ],
      ),
    );
  }
}

class _DragHandler extends StatelessWidget {
  const _DragHandler();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
        ],
      ),
    );
  }
}
