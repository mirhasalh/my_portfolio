import 'package:go_router/go_router.dart';

import 'page/pages.dart';

final router = GoRouter(
  initialLocation: '/',
  routerNeglect: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const AppsPage(),
      routes: [
        GoRoute(
          name: '/image',
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
