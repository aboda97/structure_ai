import 'package:flutter/material.dart';

// ============================================================
// Centered loading indicator, optionally with a message below it.
//
// Used while a screen waits for data:
//     return const LoadingProgress(message: 'Loading...');
// ============================================================

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({super.key, this.message});

  // Optional text shown under the spinner.
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // Column shrinks to its content so the whole thing stays centered.
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          // Only show the message when one was provided.
          if (message != null) ...[const SizedBox(height: 16), Text(message!)],
        ],
      ),
    );
  }
}
