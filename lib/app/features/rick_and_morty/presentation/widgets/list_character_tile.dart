import 'package:flutter/material.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/models/character.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/presentation/detail_character_page.dart';
import 'package:riverpod_examplee/app/shared/widgets/circular_image.dart';

/// A widget that displays a character in a list tile format.
class ListCharacterTile extends StatelessWidget {
  const ListCharacterTile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage.hero(
        width: 50,
        height: 50,
        imageUrl: character.image,
      ),
      title: Text(character.name),
      subtitle: Text('Status: ${character.status}'),
      trailing: Text('Species: ${character.species}'),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      onTap: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailCharacterPage(character: character),
      ),
    );
  }
}
