import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/models/character.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/presentation/detail/widgets/detail_app_bar.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/presentation/detail/widgets/info_row.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/presentation/detail/widgets/status_chip.dart';
import 'package:riverpod_examplee/app/shared/widgets/circular_image.dart';

/// A page that displays detailed information about a character.
class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: DetailAppBar(title: character.name),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image blurred
          CachedNetworkImage(
            imageUrl: character.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.transparent],
                stops: const [0, 0.5],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircularImage.hero(
                    imageUrl: character.image,
                    width: 280,
                    height: 280,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    character.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  StatusChip(status: character.status),
                  const SizedBox(height: 24),
                  InfoRow(label: 'Species', value: character.species),
                  const Divider(color: Colors.white24),
                  InfoRow(label: 'Gender', value: character.gender),
                  const Divider(color: Colors.white24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
