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
        children: [
          FutureBuilder<List<ProjectsModel>>(
            future: _projects,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error"));
              } else {
                final data = snapshot.data;
                return StaggeredGrid.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width <= 500 ? 2 : 3,
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
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<ProjectsModel>> _getProjects() async {
    final response = await rootBundle.loadString("json/projects.json");

    final data = json.decode(response);

    return (data as List).map((e) => ProjectsModel.fromJson(e)).toList();
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(src),
          const SizedBox(height: 12.0),
          Text(title),
          Text(
            "$joined - $until",
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
