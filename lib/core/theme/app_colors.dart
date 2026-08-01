import 'package:flutter/material.dart';

abstract final class AppColors {
  const AppColors._();

  // Brand
  static const primary = Color(0xFF2563EB);
  static const secondary = Color(0xFF7C3AED);

  // Status
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFDC2626);

  // Light
  static const lightBackground = Colors.white;

  // Dark
  static const darkBackground = Color(0xFF121212);

  // Text
  static const black = Color(0xFF111827);
  static const white = Colors.white;

  // Border
  static const border = Color(0xFFE5E7EB);
}
