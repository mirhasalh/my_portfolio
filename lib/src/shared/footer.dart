import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1d1d1f),
      alignment: Alignment.center,
      height: kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Deployed to Netlify",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.0,
        ),
      ),
    );
  }
}
