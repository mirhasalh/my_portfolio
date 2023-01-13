import 'package:flutter/material.dart';
import 'package:my_portfolio/src/bouncing_scroll_behavior.dart';
import 'package:my_portfolio/src/router.dart';
import 'package:my_portfolio/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ScrollConfiguration(
        behavior: const BouncingScrollBehavior(),
        child: child!,
      ),
      routerConfig: kRouterConfig,
      title: 'Portfolio',
      theme: kTheme,
    );
  }
}
