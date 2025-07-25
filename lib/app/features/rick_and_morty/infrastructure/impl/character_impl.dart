import 'package:riverpod_examplee/app/core/api/rick_and_morty_api.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/gateway/character_gateway.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/models/character.dart';

/// Implementation of [CharacterGateway] using [RickAndMortyApi].
class CharacterGatewayImpl implements CharacterGateway {
  final RickAndMortyApi api;

  CharacterGatewayImpl({required this.api});

  @override
  Future<List<Character>> fetchCharacters({int page = 1}) async {
    final response = await api.get(
      RickMortyEndpoints.character,
      query: {'page': page},
    );
    final results = response.data['results'] as List;
    return results.map((e) => Character.fromJson(e)).toList();
  }
}
