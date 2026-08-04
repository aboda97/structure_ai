import 'package:flutter/material.dart';

// ============================================================
// Reusable confirmation/info dialog.
//
// Instead of writing a full showDialog(...) + AlertDialog every time we
// need a simple "something happened" popup, we call:
//
//     CustomAppDialog.show(context: ..., title: ..., message: ...);
//
// ============================================================

abstract final class CustomAppDialog {
  const CustomAppDialog._();

  /// Shows a dialog with a [title], [message], and one confirm button whose
  /// label can be changed via [confirmText].
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = "OK",
  }) {
    return showDialog(
      context: context,
      // The dialog builder receives its own (dialog-scoped) context, but we
      // don't need it here: the original `context` is still valid for
      // popping the dialog we just pushed.
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              // Close the dialog when the user taps the button.
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }
}
