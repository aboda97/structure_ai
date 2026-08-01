import 'package:go_router/go_router.dart';
import 'package:structure_app/core/constants/keys_constants.dart';
import 'package:structure_app/core/routing/route_names.dart';

import '../di/service_locator.dart';
import '../storage/secure_storage.dart';

abstract final class RouteGuards {
  static Future<String?> redirect(GoRouterState state) async {
    final storage = sl<SecureStorage>();

    final token = await storage.read(key: KeysConstants.accessToken) ?? '';

    final isLoggedIn = token.isNotEmpty;

    final isLoginPage = state.matchedLocation == RouteNames.login;

    if (!isLoggedIn && !isLoginPage) {
      return RouteNames.login;
    }

    // if (isLoggedIn && isLoginPage) {
    //   return RouteNames.home;
    // }

    return null;
  }
}
