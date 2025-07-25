import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/core/api/providers/rick_and_morty_api_provider.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/gateway/character_gateway.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/infrastructure/impl/character_impl.dart';

import '../domain/enums/character_list_status.dart';
import '../domain/models/character_list_state.dart';

part 'character_service_prov.g.dart';

// Only expose the provider instead of the class.
// This way, we can control access to the provider and give it a name
// that makes sense to the rest of the app.
final characterServiceProvider = _characterServiceProvProvider;

/// State class to hold character list data and status.
@riverpod
class _CharacterServiceProv extends _$CharacterServiceProv {
  late final CharacterGateway _repository;
  int _currentPage = 1;

  @override
  CharacterListState build() {
    final api = ref.read(rickAndMortyApiProvider);
    _repository = CharacterGatewayImpl(api: api);
    Future.microtask(() => fetchFirstPage());
    return const CharacterListState();
  }

  Future<void> fetchFirstPage() async {
    state = state.copyWith(status: CharacterListStatus.loadingFirstPage);
    try {
      final characters = await _repository.fetchCharacters();
      _currentPage = 2;
      state = CharacterListState(
        characters: characters,
        status: CharacterListStatus.loaded,
        hasMore: characters.isNotEmpty,
      );
    } catch (e) {
      state = state.copyWith(
        status: CharacterListStatus.error,
        error: e.toString(),
      );
    }
  }

  Future<void> fetchNextPage() async {
    if (!state.hasMore || state.status == CharacterListStatus.loadingMore) {
      return;
    }

    state = state.copyWith(status: CharacterListStatus.loadingMore);
    try {
      await Future.delayed(const Duration(seconds: 1));
      final newCharacters = await _repository.fetchCharacters(
        page: _currentPage,
      );
      _currentPage++;
      state = state.copyWith(
        characters: [...state.characters, ...newCharacters],
        status: CharacterListStatus.loaded,
        hasMore: newCharacters.isNotEmpty,
      );
    } catch (e) {
      state = state.copyWith(
        status: CharacterListStatus.error,
        error: e.toString(),
      );
    }
  }
}
