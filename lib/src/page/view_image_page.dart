import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../constants.dart';
import '../theme.dart';

class ViewImagePage extends StatelessWidget {
  static const routeName = '/image';

  const ViewImagePage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    final url = '$kImgBbBaseUrl/$path';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Theme(
          data: darkTheme,
          child: const BackButton(),
        ),
      ),
      body: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: path),
        imageProvider: NetworkImage(url),
      ),
    );
  }
}
