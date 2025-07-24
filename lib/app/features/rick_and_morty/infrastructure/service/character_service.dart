import 'package:riverpod_examplee/app/features/rick_and_morty/domain/models/character.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/repo/character_gateway.dart';

/// Contains business logic for login, using [LoginRepository].
class CharacterService {
  CharacterService(this._characterGateway);

  final CharacterGateway _characterGateway;

  Future<List<Character>?> fetchCharacters({int page = 1}) async {
    return _characterGateway.fetchCharacters(page: page);
  }
}
