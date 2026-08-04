import 'package:flutter/material.dart';

// ============================================================
// Single source of truth for every color used in the app.
//
// Why centralize? To change the primary brand color we change ONE line
// here instead of hunting for hard-coded hex codes across the whole app.
// `const` means zero runtime cost — the values are compiled in.
// ============================================================

abstract final class AppColors {
  const AppColors._();

  // Brand colors (used as primary/secondary across the app).
  static const primary = Color(0xFF2563EB);
  static const secondary = Color(0xFF7C3AED);

  // Status colors (success / warning / error feedback).
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFDC2626);

  // Light theme background.
  static const lightBackground = Colors.white;

  // Dark theme background.
  static const darkBackground = Color(0xFF121212);

  // Text colors.
  static const black = Color(0xFF111827);
  static const white = Colors.white;

  // Border / divider color.
  static const border = Color(0xFFE5E7EB);
}
