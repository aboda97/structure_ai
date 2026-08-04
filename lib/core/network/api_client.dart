import 'package:dio/dio.dart';
import 'package:structure_app/core/errors/dio_error_mapper.dart';

// ============================================================
// Thin, clean wrapper around Dio.
//
// Features never talk to Dio directly — they call ApiClient.get/post/...
// This gives us a single place where every request is made and every error
// is translated (DioException → AppException via DioErrorMapper).
// ============================================================

final class ApiClient {
  final Dio _dio;

  const ApiClient(this._dio);

  // Each method below performs the request through Dio, and if a
  // DioException is thrown it is converted to our own AppException before
  // bubbling up. That way feature code only ever sees AppException — never
  // the Dio library types.

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  Future<Response<T>> put<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  Future<Response<T>> patch<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  Future<Response<T>> delete<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
