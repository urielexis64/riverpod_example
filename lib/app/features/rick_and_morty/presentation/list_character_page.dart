import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/presentation/widgets/list_character_tile.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/providers/character_service_prov.dart';
import 'package:riverpod_examplee/app/shared/widgets/app_error.dart';
import 'package:riverpod_examplee/app/shared/widgets/app_loader.dart';

import '../domain/enums/character_list_status.dart';

/// Page displaying a list of Rick & Morty characters.
class ListCharacterPage extends ConsumerStatefulWidget {
  const ListCharacterPage({super.key});

  @override
  ConsumerState<ListCharacterPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends ConsumerState<ListCharacterPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(characterServiceProvProvider.notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(characterServiceProvProvider);

    // Calculate the total number of children, including a loader if more data is available.
    final childCount = state.characters.length + (state.hasMore ? 1 : 0);

    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: switch (state.status) {
        CharacterListStatus.loadingFirstPage => AppLoader(),
        CharacterListStatus.error => AppError(message: state.error),
        _ => CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(childCount: childCount, (
                _,
                index,
              ) {
                if (index < state.characters.length) {
                  final character = state.characters[index];
                  return ListCharacterTile(character: character);
                }

                return AppLoader();
              }),
            ),
          ],
        ),
      },
    );
  }
}
