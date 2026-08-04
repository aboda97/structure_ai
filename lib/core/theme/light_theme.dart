import 'package:flutter/material.dart';

import 'app_colors.dart';

// ============================================================
// The light theme of the app.
//
// ThemeData centralizes the "look" of Material widgets: instead of styling
// each button/input on every screen, we configure defaults once here and
// every widget picks them up automatically.
// ============================================================

abstract final class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,

      // Default background color of every Scaffold.
      scaffoldBackgroundColor: AppColors.lightBackground,

      primaryColor: AppColors.primary,

      // The ColorScheme drives most widgets (AppBar, FAB, selection...).
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
      ),

      // AppBar: centered title, no shadow/elevation by default.
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),

      // ElevatedButtons: full-width and 50px tall by default.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),

      // Text fields: outlined borders by default.
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
