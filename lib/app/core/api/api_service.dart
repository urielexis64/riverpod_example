import 'package:dio/dio.dart';

/// Central HTTP client service using Dio.
class ApiService {
  final Dio _dio;

  ApiService({Dio? dio}) : _dio = dio ?? Dio() {
    // Optional: interceptors, auth, logging, etc.
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  /// Performs a GET request.
  Future<Response> get(String path, {Map<String, dynamic>? query}) {
    //log
    return _dio.get(path, queryParameters: query);
  }

  /// Performs a POST request.
  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }

  /// Add more verbs as needed: put(), delete(), patch(), etc.
}
