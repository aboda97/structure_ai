import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('➡️ ${options.method} ${options.uri}');
      debugPrint('Headers: ${options.headers}');
      debugPrint('Body: ${options.data}');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('✅ ${response.statusCode}');
      debugPrint(response.data.toString());
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('❌ ${err.message}');
    }

    handler.next(err);
  }
}
