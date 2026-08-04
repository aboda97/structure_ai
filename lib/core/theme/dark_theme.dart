import 'package:flutter/material.dart';

import 'app_colors.dart';

// ============================================================
// The dark theme of the app.
//
// Same idea as LightTheme, but with a dark background. Note that it
// currently only sets colors — component defaults (buttons, inputs) come
// from the light theme's settings when the app switches themes, which is
// acceptable for now but could be extracted into a shared base later.
// ============================================================

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
