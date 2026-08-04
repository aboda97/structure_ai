import 'package:flutter/material.dart';

// ============================================================
// Convenience "shortcuts" on BuildContext for theme values.
//
// Instead of the verbose:
//     Theme.of(context).colorScheme.primary
// we write the short:
//     context.colors.primary
//
// An extension only adds these helpers when this file is imported, and it
// costs nothing at runtime — it is purely a readability improvement.
// ============================================================

extension ThemeExtension on BuildContext {
  /// The full ThemeData of the current theme.
  ThemeData get theme => Theme.of(this);

  /// The current color scheme (colors adapted to light/dark mode).
  ColorScheme get colors => theme.colorScheme;

  /// The current text theme.
  TextTheme get text => theme.textTheme;

  /// Whether the app is currently in dark mode.
  bool get isDark => theme.brightness == Brightness.dark;
}
