import 'package:dio/dio.dart';

final class RetryInterceptor extends Interceptor {
  final Dio dio;

  const RetryInterceptor({required this.dio});

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.type == DioExceptionType.connectionTimeout) {
      final response = await dio.fetch(err.requestOptions);

      handler.resolve(response);

      return;
    }

    handler.next(err);
  }
}
