import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/model/project_model.dart';
import 'package:my_portfolio/src/page/pages.dart';

class MyRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: <GoRoute>[
          GoRoute(
            path: 'details/:id',
            builder: (context, state) {
              // ProjectsModel? project;
              return ProjectDetailsPage(
                id: state.params["id"]!,
                project: state.extra as ProjectModel,
              );
            },
          ),
        ],
      )
    ],
  );
}
