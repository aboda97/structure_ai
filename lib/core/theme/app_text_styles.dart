import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  const AppTextStyles._();

  static TextStyle heading(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }

  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }

  static TextStyle body(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  static TextStyle caption(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }
}
