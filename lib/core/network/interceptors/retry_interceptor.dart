import 'package:dio/dio.dart';

// ============================================================
// RETRY INTERCEPTOR — currently NOT registered in DioClient.create().
//
// Idea: on a connection timeout (weak network), automatically re-send the
// request once instead of failing immediately. `dio.fetch` re-issues the
// exact same request options; `handler.resolve` then hands the fresh
// response back to the caller as if nothing went wrong.
// ============================================================

final class RetryInterceptor extends Interceptor {
  // The Dio instance used to re-execute the failed request.
  final Dio dio;

  const RetryInterceptor({required this.dio});

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Only retry connection-timeout failures, not server errors etc.
    if (err.type == DioExceptionType.connectionTimeout) {
      // Re-run the original request with the same options.
      final response = await dio.fetch(err.requestOptions);

      // Resolve means "this is the final result — pretend it succeeded".
      handler.resolve(response);

      return;
    }

    // All other errors pass through untouched.
    handler.next(err);
  }
}
