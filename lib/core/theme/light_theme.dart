import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: AppColors.lightBackground,

      primaryColor: AppColors.primary,

      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
      ),

      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
