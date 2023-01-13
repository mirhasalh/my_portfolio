import 'package:flutter/material.dart';
import 'package:my_portfolio/src/model/project_model.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({
    super.key,
    required this.id,
    required this.project,
  });

  final String id;
  final ProjectModel project;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  static const double _kTechStackPaddingHoriz = 9.0;
  static const double _kTechStackPaddingVert = 3.0;
  static const String _initCommit = "Initial commit";

  final BoxDecoration _techStackBoxDecor = BoxDecoration(
    color: const Color(0xfff5f8fa),
    borderRadius: BorderRadius.circular(20.0),
    border: Border.all(
      color: const Color(0xffd0d0d0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Info"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: kToolbarHeight),
        children: [
          _buildProjectDetails(widget.project.vertical!),
        ],
      ),
    );
  }

  Widget _buildProjectDetails(bool verticalImage) {
    if (verticalImage) {
      return MediaQuery.of(context).size.width >= 800
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget.id,
                    child: Image.network(widget.project.image!),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12.0),
                        _buildProjectType(widget.project.type!),
                        const SizedBox(height: 8.0),
                        Text('$_initCommit ${widget.project.init!}'),
                        const SizedBox(height: 8.0),
                        Text(widget.project.status!),
                        const SizedBox(height: 8.0),
                        Text(widget.project.desc!),
                        const SizedBox(height: 8.0),
                        _buildTechStack(widget.project.techStack!),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(height: 12.0),
                      _buildProjectType(widget.project.type!),
                      const SizedBox(height: 8.0),
                      Text('$_initCommit ${widget.project.init!}'),
                      const SizedBox(height: 8.0),
                      Text(widget.project.status!),
                      const SizedBox(height: 8.0),
                      Text(widget.project.desc!),
                      const SizedBox(height: 8.0),
                      _buildTechStack(widget.project.techStack!),
                    ],
                  ),
                ),
              ],
            );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 12.0),
                _buildProjectType(widget.project.type!),
                const SizedBox(height: 8.0),
                Text('$_initCommit ${widget.project.init!}'),
                const SizedBox(height: 8.0),
                Text(widget.project.status!),
                const SizedBox(height: 8.0),
                Text(widget.project.desc!),
                const SizedBox(height: 8.0),
                _buildTechStack(widget.project.techStack!),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildTechStack(String techStack) {
    if (techStack != 'n/a') {
      final splits = techStack.split(',');
      return Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text("Tech stack: "),
          ...List.generate(
            splits.length,
            (index) => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: _kTechStackPaddingHoriz,
                vertical: _kTechStackPaddingVert,
              ),
              decoration: _techStackBoxDecor,
              child: Text(
                splits[index],
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: _kTechStackPaddingHoriz,
          vertical: _kTechStackPaddingVert,
        ),
        decoration: _techStackBoxDecor,
        child: const Text('UI kit only'),
      );
    }
  }

  Widget _buildProjectType(int type) {
    if (type == 1) {
      return Text(
        'Public',
        style: Theme.of(context).textTheme.caption,
      );
    } else {
      return Text(
        'Private',
        style: Theme.of(context).textTheme.caption,
      );
    }
  }
}
