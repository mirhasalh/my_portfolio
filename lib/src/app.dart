import 'package:flutter/material.dart';
import 'package:my_portfolio/src/router.dart';
import 'package:my_portfolio/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: kRouterConfig,
      title: 'Portfolio',
      theme: kTheme,
    );
  }
}
