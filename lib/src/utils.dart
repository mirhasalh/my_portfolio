import 'dart:convert';

import 'package:flutter/services.dart';

import 'model/project.dart';

String viewImagePathFormat(String text) {
  var split = text.split('IMG');

  return '/${split[0]}/IMG${split.last}';
}

Future<List<Project>> getProjects() async {
  const path = 'json/projects.json';

  final src = await rootBundle.loadString(path);

  final data = json.decode(src);

  return (data as List).map((e) => Project.fromJson(e)).toList();
}
