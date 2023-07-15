import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../constants.dart';
import '../utils.dart' show viewImagePathFormat;

class ViewImagePage extends StatelessWidget {
  static const routeName = '/image';

  const ViewImagePage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    final url = '$kImgBbBaseUrl${viewImagePathFormat(path)}';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black87,
      body: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: path),
        imageProvider: NetworkImage(url),
      ),
    );
  }
}
