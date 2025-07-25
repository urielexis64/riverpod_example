import 'package:dio/dio.dart';

/// Constants for Rick & Morty API endpoints.
abstract class RickMortyEndpoints {
  static const String character = '/character';
}

class ApiBase {
  final Dio _dio;

  ApiBase({Dio? dio}) : _dio = dio ?? Dio() {
    // Optional: interceptors, auth, logging, etc.
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  // get function
  Future<Response> get(String path, {Map<String, dynamic>? query}) {
    return _dio.get(path, queryParameters: query);
  }

  // post function
  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }
}

/// Central HTTP client service using Dio.
class ApiShopify extends ApiBase {
  final Dio _dio;

  ApiShopify({Dio? dio}) : _dio = dio ?? Dio() {
    // Optional: interceptors, auth, logging, etc.
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  /// Performs a GET request.
  @override
  Future<Response> get(String path, {Map<String, dynamic>? query}) {
    print('get');
    return _dio.get(path, queryParameters: query);
  }

  /// Performs a POST request.
  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }

  /// Add more verbs as needed: put(), delete(), patch(), etc.
}
