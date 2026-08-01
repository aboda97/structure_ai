import 'package:dio/dio.dart';
import 'package:structure_app/core/constants/api_constants.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

final class DioClient {
  final ApiConstants constant;
  final AuthInterceptor authInterceptor;
  final LoggerInterceptor loggerInterceptor;

  const DioClient({
    required this.constant,
    required this.authInterceptor,
    required this.loggerInterceptor,
  });

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: constant.baseUrl,
        connectTimeout: constant.connectionTimeout,
        receiveTimeout: constant.receiveTimeout,
        sendTimeout: constant.connectionTimeout,
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([authInterceptor, loggerInterceptor]);

    return dio;
  }
}
