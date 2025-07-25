import 'package:riverpod_examplee/app/features/rick_and_morty/domain/gateway/character_gateway.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/models/character.dart';

/// Service class for Rick and Morty characters.
class CharacterService {
  CharacterService(this._characterGateway);

  final CharacterGateway _characterGateway;

  Future<List<Character>?> fetchCharacters({int page = 1}) async {
    return _characterGateway.fetchCharacters(page: page);
  }
}
