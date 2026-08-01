import 'package:dio/dio.dart';

final class RefreshTokenInterceptor extends Interceptor {
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

    handler.next(err);
  }
}
