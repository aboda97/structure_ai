import 'package:go_router/go_router.dart';
import 'route_guards.dart';
import 'route_names.dart';

// ============================================================
// The single GoRouter configuration for the whole app.
//
// GoRouter is a routing package: it maps path strings ("/login") to the
// widget to show, runs redirect guards, and handles navigation state.
// There is exactly ONE router for the app (a static singleton), used by
// MaterialApp.router in app.dart.
// ============================================================

final class AppRouter {
  AppRouter._();

  // Static singleton — the same router instance everywhere.
  static final GoRouter router = GoRouter(
    // The first screen the app tries to open: the splash ("/").
    initialLocation: RouteNames.splash,

    // Guards run before every navigation; they decide whether the user may
    // proceed or must be redirected (e.g. to login). The explicit cast is
    // not strictly required but makes the redirect signature explicit.
    redirect: RouteGuards.redirect as GoRouterRedirect,

    routes: [
      // Login route. `builder` (which widget to show) is still commented
      // because the login screen has not been implemented yet. Adding a
      // route means: add its name here AND in RouteNames (and guard it in
      // RouteGuards if it is protected).
      GoRoute(
        path: RouteNames.login,
        //  builder: (_, __) => const LoginPage(),
      ),
    ],
  );
}
