import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,

      scaffoldBackgroundColor: AppColors.darkBackground,

      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
      ),
    );
  }
}
