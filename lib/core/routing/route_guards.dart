import 'package:go_router/go_router.dart';
import 'package:structure_app/core/constants/keys_constants.dart';
import 'package:structure_app/core/routing/route_names.dart';

import '../di/service_locator.dart';
import '../storage/secure_storage.dart';

// ============================================================
// Route guards: run BEFORE a navigation happens and can redirect the user
// somewhere else (like a firewall for screens).
//
// Here: if the user is NOT logged in (no access token) and tries to open
// any screen other than login, we bounce them to the login screen.
// ============================================================

abstract final class RouteGuards {
  /// Called by GoRouter on every navigation. Return a path to redirect to,
  /// or `null` to allow the navigation.
  static Future<String?> redirect(GoRouterState state) async {
    // Get the secure-storage wrapper from DI (registered in core_injection).
    final storage = sl<SecureStorage>();

    // Read the access token. Empty/missing token == not logged in.
    final token = await storage.read(key: KeysConstants.accessToken) ?? '';

    final isLoggedIn = token.isNotEmpty;

    // Is the target screen the login page itself?
    final isLoginPage = state.matchedLocation == RouteNames.login;

    // Not logged in AND not already going to login → force login.
    if (!isLoggedIn && !isLoginPage) {
      return RouteNames.login;
    }

    // If the user is logged in and lands on the login page, we could
    // redirect them to the home screen instead. Left commented as a
    // reminder until the home route exists.
    // if (isLoggedIn && isLoginPage) {
    //   return RouteNames.home;
    // }

    // Allow the navigation to proceed.
    return null;
  }
}
