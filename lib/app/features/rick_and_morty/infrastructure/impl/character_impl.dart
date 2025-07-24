import 'package:riverpod_examplee/app/core/api/api_service.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/constants/rick_morty_endpoints.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/models/character.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/domain/repo/character_gateway.dart';

/// Implementation of [CharacterGateway] using [ApiService].
class CharacterGatewayImpl implements CharacterGateway {
  final ApiService apiService;

  CharacterGatewayImpl({required this.apiService});

  @override
  Future<List<Character>> fetchCharacters({int page = 1}) async {
    final response = await apiService.get(
      RickMortyEndpoints.character,
      query: {'page': page},
    );
    final results = response.data['results'] as List;
    return results.map((e) => Character.fromJson(e)).toList();
  }
}
