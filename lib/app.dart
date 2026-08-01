import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'Structure App',

      theme: LightTheme.theme,

      darkTheme: DarkTheme.theme,

      themeMode: ThemeMode.system,

      routerConfig: AppRouter.router,
    );
  }
}
