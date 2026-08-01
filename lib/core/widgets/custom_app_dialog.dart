import 'package:flutter/material.dart';

abstract final class CustomAppDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = "OK",
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
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
