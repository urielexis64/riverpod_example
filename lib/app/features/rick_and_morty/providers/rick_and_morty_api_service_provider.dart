import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examplee/app/core/api/api_service.dart';

part 'rick_and_morty_api_service_provider.g.dart';

/// Provides a singleton instance of ApiService using Dio as its gateway.
@riverpod
ApiService rickAndMortyApiService(Ref ref) {
  final rickAndMortyDio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
    ),
  );
  return ApiService(dio: rickAndMortyDio); // Optionally inject Dio
}
