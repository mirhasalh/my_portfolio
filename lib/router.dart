import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/page/home_page.dart';

class MyRouter {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      )
    ],
  );
}
