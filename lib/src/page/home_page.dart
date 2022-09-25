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

  static const String _whitespaces = "    ";

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
                      MediaQuery.of(context).size.width <= 500 ? 2 : 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: List.generate(
                    data!.length,
                    (index) => Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(data[index].image!),
                          const SizedBox(height: 12.0),
                          Text("$_whitespaces${data[index].title!}"),
                          Text("${_whitespaces}Start: ${data[index].est!}"),
                          Text("${_whitespaces}Until: ${data[index].until!}"),
                          const SizedBox(height: 12.0),
                        ],
                      ),
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
