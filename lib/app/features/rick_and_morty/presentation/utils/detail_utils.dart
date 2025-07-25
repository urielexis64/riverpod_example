import 'package:flutter/material.dart';

/// Utility class for character detail page.
abstract class DetailUtils {
  static Color statusToColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.greenAccent.shade700;
      case 'dead':
        return Colors.redAccent.shade700;
      default:
        return Colors.grey.shade600;
    }
  }
}
