import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
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
              title: Text(
                'Showcases',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
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
                  icon: const Icon(Icons.android, color: Colors.black54),
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
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(width: kIsWeb ? 8.0 : 0.0)
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
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: List.generate(
                    proj!.length,
                    (index) => _Project(
                      id: '${proj[index].id}',
                      src: proj[index].image!,
                      title: proj[index].title!,
                      initialCommit: proj[index].init!,
                      projectStatus: proj[index].status!,
                      onTap: () {},
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
}

class _Project extends StatelessWidget {
  const _Project({
    required this.id,
    required this.src,
    required this.title,
    required this.initialCommit,
    required this.projectStatus,
    required this.onTap,
  });

  final String id;
  final String src;
  final String title;
  final String initialCommit;
  final String projectStatus;
  final VoidCallback onTap;

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
              Hero(
                tag: id,
                child: !kIsWeb
                    ? FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: src,
                      )
                    : Image.network(src),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
