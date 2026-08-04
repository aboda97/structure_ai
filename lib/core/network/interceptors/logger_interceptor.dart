import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// ============================================================
// Logging interceptor: prints every request, response, and error to the
// console so developers can see what the app is sending and receiving.
//
// Everything is guarded by `kDebugMode` — a Flutter constant that is true
// only in debug builds. This means ALL logging is stripped out of release
// builds automatically (no sensitive traffic in production logs).
// ============================================================

final class LoggerInterceptor extends Interceptor {
  // Before the request is sent: show method, full URL, headers, body.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('➡️ ${options.method} ${options.uri}');
      debugPrint('Headers: ${options.headers}');
      debugPrint('Body: ${options.data}');
    }

    handler.next(options);
  }

  // After a successful response: show status code and body.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('✅ ${response.statusCode}');
      debugPrint(response.data.toString());
    }

    handler.next(response);
  }

  // When a request fails: show the error message.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('❌ ${err.message}');
    }

    handler.next(err);
  }
}
