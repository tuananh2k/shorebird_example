import 'package:dio/dio.dart';

class Request {
  final Dio _dio = Dio();

  // requests
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    Options? options;
    if (headers != null) {
      options = Options(headers: headers);
    }
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, String>? headers,
  }) async {
    Options? options;
    if (headers != null) {
      options = Options(headers: headers);
    }
    return await _dio.post(path, data: data, options: options);
  }
}
