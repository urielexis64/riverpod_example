import 'package:flutter/material.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/presentation/utils/detail_utils.dart';

/// A widget that displays a status chip for a character.
class DetailStatusChip extends StatelessWidget {
  const DetailStatusChip({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: DetailUtils.statusToColor(status),
      label: Text(
        status.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
