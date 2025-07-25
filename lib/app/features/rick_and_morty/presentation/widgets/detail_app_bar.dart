import 'package:flutter/material.dart';

/// A custom app bar for the character detail page.
class DetailAppBar extends AppBar {
  DetailAppBar({super.key, required String title})
    : super(
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      );
}
