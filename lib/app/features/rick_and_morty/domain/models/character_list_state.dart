import '../enums/character_list_status.dart';
import 'character.dart';

/// Represents the state of the character list in the application.
class CharacterListState {
  final List<Character> characters;
  final CharacterListStatus status;
  final bool hasMore;
  final String? error;

  const CharacterListState({
    this.characters = const [],
    this.status = CharacterListStatus.initial,
    this.hasMore = true,
    this.error,
  });

  CharacterListState copyWith({
    List<Character>? characters,
    CharacterListStatus? status,
    bool? hasMore,
    String? error,
  }) {
    return CharacterListState(
      characters: characters ?? this.characters,
      status: status ?? this.status,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }
}
