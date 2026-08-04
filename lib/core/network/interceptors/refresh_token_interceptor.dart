import 'package:dio/dio.dart';

// ============================================================
// TOKEN REFRESH INTERCEPTOR — currently a SKELETON (not wired up).
//
// Intended behavior: when a request fails with 401 "Unauthorized", the
// access token has probably expired. This interceptor should:
//   1. call a refresh endpoint using the saved refresh token,
//   2. save the new access token to secure storage,
//   3. re-send (retry) the original request with the new token.
//
// The TODO below marks where that logic goes. Until it is implemented, it
// is NOT registered in DioClient.create(), so 401s simply fail.
// ============================================================

final class RefreshTokenInterceptor extends Interceptor {
  // Reference to the Dio instance so we can re-issue the failed request.
  final Dio dio;

  const RefreshTokenInterceptor({required this.dio});

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // TODO:
      // Refresh Token
      // Save New Token
      // Retry Request
    }

    // Forward the error unchanged (for now) — without handler.next, the
    // failure would never reach the caller.
    handler.next(err);
  }
}
