import 'package:flutter/material.dart';

/// A widget that displays an error message.
class AppError extends StatelessWidget {
  const AppError({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final message = this.message ?? 'An unexpected error occurred.';
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Error: $message'),
      ),
    );
  }
}
