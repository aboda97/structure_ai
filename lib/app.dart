import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

// ============================================================
// Root widget of the app.
//
// It only sets up the "shell" (MaterialApp): the router that decides which
// screen to show, and the light/dark themes. It has no UI logic of its own —
// the actual screens are delivered by the GoRouter.
// ============================================================

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router ties Flutter to our GoRouter: instead of manually
    // pushing screens with Navigator, the router maps routes to widgets and
    // runs the guard logic (e.g. redirect to login when not signed in).
    return MaterialApp.router(
      // Hides the "DEBUG" banner from the top-right corner.
      debugShowCheckedModeBanner: false,

      title: 'Structure App',

      // Light and dark themes, plus a mode that follows the device's
      // light/dark preference automatically.
      theme: LightTheme.theme,

      darkTheme: DarkTheme.theme,

      themeMode: ThemeMode.system,

      // The single GoRouter instance that owns all routes and redirects.
      routerConfig: AppRouter.router,
    );
  }
}
