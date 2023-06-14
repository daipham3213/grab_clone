import 'package:go_router/go_router.dart';
import 'package:grab_clone/features/app/view/app_director.dart';

class Route {
  const Route({required this.path, required this.name, this.pageBuilder});

  final String path;
  final String name;
  final GoRouterPageBuilder? pageBuilder;
}

class Routes {
  Routes._();

  static const Route home = Route(
    path: '/',
    name: 'home',
  );

  static const Route login = Route(
    path: '/login',
    name: 'login',
  );

  static const Route register = Route(
    path: '/register',
    name: 'register',
  );

  static GoRouter get router => _router;

  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: home.path,
        name: home.name,
        builder: (context, state) => const AppDirector(),
      ),
    ],
  );
}
