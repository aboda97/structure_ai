import 'package:flutter/material.dart';

// ============================================================
// Primary action button used on forms/screens.
//
// Features:
//  - full width (SizedBox + double.infinity),
//  - built-in loading state: when `isLoading` is true the button is
//    disabled and shows a spinner instead of the text,
//  - optional leading icon.
//
// Usage:
//     CustomBtnPrimary(
//       text: 'Login',
//       isLoading: cubit.isLoading,
//       onPressed: () => cubit.login(),
//     )
// ============================================================

class CustomBtnPrimary extends StatelessWidget {
  const CustomBtnPrimary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        // Disable the button while loading (prevents double taps).
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            // Loading state: small circular spinner.
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            // Normal state: optional icon + label, centered.
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 8)],
                  Text(text),
                ],
              ),
      ),
    );
  }
}
