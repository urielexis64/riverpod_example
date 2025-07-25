import 'dart:developer';

import 'package:dio/dio.dart';

/// Central HTTP client service using Dio.
class Api {
  Dio get dio => Dio();

  /// Performs a GET request.
  Future<Response> get(String path, {Map<String, dynamic>? query}) {
    log('Executing GET request from Api Base');
    return dio.get(path, queryParameters: query);
  }

  /// Performs a POST request.
  Future<Response> post(String path, {dynamic data}) {
    return dio.post(path, data: data);
  }
}
