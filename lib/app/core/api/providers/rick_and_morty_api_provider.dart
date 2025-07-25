import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/core/api/rick_and_morty_api.dart';

part 'rick_and_morty_api_provider.g.dart';

/// Provides a singleton instance of ApiService using Dio as its gateway.
@riverpod
RickAndMortyApi rickAndMortyApi(Ref ref) => RickAndMortyApi();
