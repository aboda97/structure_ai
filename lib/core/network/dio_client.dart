import 'package:dio/dio.dart';
import 'package:structure_app/core/constants/api_constants.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

// ============================================================
// Builds and configures the Dio HTTP client.
//
// Its only job is the "creation" part: base URL, timeouts, default headers,
// and attaching the interceptors. Making actual requests is done through
// ApiClient.
//
// Values come with sensible defaults pulled from ApiConstants, so callers
// only need to pass the interceptors.
// ============================================================

final class DioClient {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final AuthInterceptor authInterceptor;
  final LoggerInterceptor loggerInterceptor;

  const DioClient({
    this.baseUrl = ApiConstants.baseUrl,
    this.connectTimeout = ApiConstants.connectionTimeout,
    this.receiveTimeout = ApiConstants.receiveTimeout,
    required this.authInterceptor,
    required this.loggerInterceptor,
  });

  /// Returns a fully-configured Dio instance.
  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        // Reuse the connect timeout for sending as well — the whole request
        // lifecycle gives up within the same budget.
        sendTimeout: connectTimeout,
        // All requests talk JSON by default.
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        },
      ),
    );

    // Interceptors run around every request (in order): auth adds the
    // token, logger prints the traffic in debug mode.
    dio.interceptors.addAll([authInterceptor, loggerInterceptor]);

    return dio;
  }
}
