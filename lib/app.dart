import 'package:flutter/material.dart';
import 'package:my_portfolio/router.dart';
import 'package:my_portfolio/src/theme/theme.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: kRouterConfig,
      title: 'My Portfolio',
      theme: kTheme,
    );
  }
}
