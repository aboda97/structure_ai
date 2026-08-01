import 'package:go_router/go_router.dart';
import 'route_guards.dart';
import 'route_names.dart';

final class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,

    redirect: RouteGuards.redirect as GoRouterRedirect,

    routes: [
      GoRoute(
        path: RouteNames.login,
        //  builder: (_, __) => const LoginPage(),
      ),
    ],
  );
}
