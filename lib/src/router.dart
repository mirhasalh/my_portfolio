import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/model/project_model.dart';
import 'package:my_portfolio/src/page/pages.dart';

final kRouterConfig = GoRouter(
  initialLocation: '/',
  routerNeglect: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'details/:id',
          builder: (context, state) {
            return ProjectDetailsPage(
              id: state.params["id"]!,
              project: state.extra as ProjectModel,
            );
          },
          redirect: (context, state) {
            if (state.extra == null) {
              return '/';
            }

            return null;
          },
        ),
      ],
    )
  ],
  errorBuilder: (context, state) => ErrorPage(error: '${state.error}'),
);
