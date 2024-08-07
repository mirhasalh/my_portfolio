import 'dart:convert';

import 'package:flutter/services.dart';

import 'model/project.dart';

Future<List<Project>> getProjects() async {
  const path = 'json/projects.json';

  final src = await rootBundle.loadString(path);

  final data = json.decode(src);

  return (data as List).map((e) => Project.fromJson(e)).toList();
}

String getHostName(String url) {
  final split = url.split('/');
  return split[2];
}
