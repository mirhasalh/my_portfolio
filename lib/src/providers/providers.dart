import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/project.dart';
import '../utils.dart' show getProjects;

part 'providers.g.dart';

@riverpod
Future<List<Project>> projects(ProjectsRef ref) async {
  final projects = getProjects();
  return projects;
}
