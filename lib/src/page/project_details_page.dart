import 'package:flutter/material.dart';
import 'package:my_portfolio/src/model/projects_model.dart';
import 'package:my_portfolio/src/shared/shared.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({
    super.key,
    required this.id,
    required this.project,
  });

  final String id;
  final ProjectsModel project;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
      ),
      body: ListView(
        children: [
          Hero(
            tag: widget.id,
            child: Image.network(widget.project.image!),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.title!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('${widget.project.type}'),
                Text(widget.project.init!),
                Text(widget.project.status!),
                Text(widget.project.desc!),
              ],
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
