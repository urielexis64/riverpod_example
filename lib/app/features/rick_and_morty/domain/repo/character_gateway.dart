import '../models/character.dart';

/// Gateway contract for fetching characters.
abstract class CharacterGateway {
  /// Fetches first page of characters.
  Future<List<Character>> fetchCharacters({int page = 1});
}
