import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portfolio/src/model/projects_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<List<ProjectsModel>> _projects = _getProjects();

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
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 16.0),
          Text(
            "Development Snippets",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16.0),
          FutureBuilder<List<ProjectsModel>>(
            future: _projects,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error"));
              } else {
                final data = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: StaggeredGrid.count(
                    crossAxisCount:
                        _getAxisCount(MediaQuery.of(context).size.width),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: List.generate(
                      data!.length,
                      (index) => _ProjectCard(
                        src: data[index].image!,
                        title: data[index].title!,
                        joined: data[index].joined!,
                        until: data[index].until!,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16.0),
          const _Footer(),
        ],
      ),
    );
  }

  Future<List<ProjectsModel>> _getProjects() async {
    final response = await rootBundle.loadString("json/projects.json");

    final data = json.decode(response);

    return (data as List).map((e) => ProjectsModel.fromJson(e)).toList();
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
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.src,
    required this.title,
    required this.joined,
    required this.until,
  });

  final String src;
  final String title;
  final String joined;
  final String until;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Image.network(src)),
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
              "$joined - $until",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1d1d1f),
      alignment: Alignment.center,
      height: 36.0,
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Deployed to Netlify",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.0,
        ),
      ),
    );
  }
}
