import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/core/api/rick_and_morty_api.dart';

part 'rick_and_morty_api_provider.g.dart';

// Only expose the provider instead of the class.
// This way, we can control access to the provider and give it a name
// that makes sense to the rest of the app.
final rickAndMortyApiProvider = _rickAndMortyApiProvider;

/// Provides a singleton instance of ApiService using Dio as its gateway.
@riverpod
RickAndMortyApi _rickAndMortyApi(Ref ref) => RickAndMortyApi();
