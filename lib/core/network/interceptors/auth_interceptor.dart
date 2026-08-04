import 'package:dio/dio.dart';
import 'package:structure_app/core/constants/keys_constants.dart';
import 'package:structure_app/core/storage/secure_storage.dart';

// ============================================================
// Dio "interceptor": code that runs automatically at a specific point in
// every request's lifecycle. This one hooks into `onRequest` — meaning
// BEFORE the request leaves the device.
//
// Job: attach the access token to every request as
// `Authorization: Bearer <token>`, so we never write the header manually
// in every ApiClient call.
//
// Why SecureStorage (our interface) and not the plugin directly? For
// consistency with RouteGuards and testability — we can inject a fake
// storage in tests.
// ============================================================

final class AuthInterceptor extends Interceptor {
  final SecureStorage storage;

  const AuthInterceptor({required this.storage});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Read the saved access token (null if the user never logged in).
    final token = await storage.read(key: KeysConstants.accessToken);

    // Only add the header when we actually have a token.
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // `handler.next(...)` releases the request to continue its lifecycle
    // (next interceptor → send). If we never called this, the request
    // would hang forever.
    handler.next(options);
  }
}
