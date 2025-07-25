import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_examplee/app/core/api/api.dart';

/// Implementation of [Api] for Rick & Morty API.
class RickAndMortyApi extends Api {
  @override
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
    ),
  );

  @override
  Future<Response> get(String path, {Map<String, dynamic>? query}) {
    log('Executing GET request from RickAndMortyApi');
    return super.get(path, query: query);
  }
}

abstract class RickMortyEndpoints {
  static const String character = '/character';
}
