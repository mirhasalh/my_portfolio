import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/page/pages.dart';

final kRouterConfig = GoRouter(
  initialLocation: '/',
  routerNeglect: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const ShowcasesPage(),
      routes: [
        GoRoute(
          name: ViewImagePage.routeName,
          path: 'image/:path',
          builder: (context, state) => ViewImagePage(
            path: state.params['path']!,
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorPage(error: '${state.error}'),
);
