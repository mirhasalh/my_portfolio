import 'package:flutter/material.dart';
import 'package:my_portfolio/src/utils/string_format.dart';
import 'package:photo_view/photo_view.dart';

const kBaseUrl = 'https://i.ibb.co';

class ViewImagePage extends StatelessWidget {
  static const routeName = 'image';

  const ViewImagePage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black87,
      body: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: path),
        imageProvider: NetworkImage('$kBaseUrl${StringFormat().path(path)}'),
      ),
    );
  }
}
