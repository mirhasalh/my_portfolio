import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/page/pages.dart';

final router = GoRouter(
  initialLocation: '/',
  routerNeglect: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const ShowcasesPage(),
      routes: [
        GoRoute(
          name: ViewImagePage.routeName,
          path: ':path/:path2',
          builder: (context, state) => ViewImagePage(
            path:
                '${state.pathParameters['path']!}${state.pathParameters['path2']!}',
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorPage(error: '${state.error}'),
);
