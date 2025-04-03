import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 5000),
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  // Add interceptors if needed
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
});
