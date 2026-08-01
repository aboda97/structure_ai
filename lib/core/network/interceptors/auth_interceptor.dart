import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:structure_app/core/constants/keys_constants.dart';

final class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  const AuthInterceptor({required this.storage, required Object secureStorage});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: KeysConstants.accessToken);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
