import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/repo/character_gateway.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/infrastructure/impl/character_impl.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/providers/rick_and_morty_api_service_provider.dart';

import '../domain/enums/character_list_status.dart';
import '../domain/models/character_list_state.dart';

part 'character_service_provider.g.dart';

/// State class to hold character list data and status.
@riverpod
class CharacterService extends _$CharacterService {
  late final CharacterGateway _repository;
  int _currentPage = 1;

  @override
  CharacterListState build() {
    final api = ref.read(rickAndMortyApiServiceProvider);
    _repository = CharacterGatewayImpl(apiService: api);
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
