import 'dart:convert';

import 'package:universal_html/html.dart' as html;
import 'package:my_portfolio/src/shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/src/asset/icon_assets.dart';
import 'package:my_portfolio/src/model/project_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<List<ProjectModel>> _projects = _getProjects();

  @override
  void initState() {
    super.initState();
    _getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Folio'),
        actions: [
          IconButton(
            onPressed: () {
              if (kIsWeb) {
                html.window.open(
                    'https://github.com/mirhasalh/my_portfolio', '_blank');
              }

              // TODO: Action for each target platforms
            },
            splashRadius: 20.0,
            icon: SvgPicture.asset(
              IconAssets.github,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: kIsWeb ? 8.0 : 0.0)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<List<ProjectModel>>(
            future: _projects,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator();
              } else if (snapshot.hasError) {
                return const Center(child: Text("Failed to load"));
              } else {
                final data = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 12.0),
                      Text(
                        'Development Snippets',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12.0),
                      StaggeredGrid.count(
                        crossAxisCount:
                            _getAxisCount(MediaQuery.of(context).size.width),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        children: List.generate(
                          data!.length,
                          (index) => _ProjectCard(
                            id: '${data[index].id}',
                            src: data[index].image!,
                            title: data[index].title!,
                            initialCommit: data[index].init!,
                            projectStatus: data[index].status!,
                            onTap: () => _onTap(
                              data[index].id!,
                              data[index],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                );
              }
            },
          ),
          const Footer(),
        ],
      ),
    );
  }

  Future<List<ProjectModel>> _getProjects() async {
    final response = await rootBundle.loadString("json/projects.json");

    final data = json.decode(response);

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

  void _onTap(int id, ProjectModel project) => context.go(
        '/details/$id',
        extra: project,
      );
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
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
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Hero(
                tag: id,
                child: !kIsWeb
                    ? FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: src,
                      )
                    : Image.network(src),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                title,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                initialCommit,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                projectStatus,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
