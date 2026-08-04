import 'dart:io';
import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

// ============================================================
// Converts low-level Dio errors (DioException) into our own
// AppException types.
//
// This is the ONLY file in the app that "understands" the Dio library.
// If we ever switch HTTP libraries, this single class is what changes.
// ============================================================

abstract final class DioErrorMapper {
  const DioErrorMapper._();

  /// Takes any DioException and returns the matching AppException.
  /// The mapping is based on the error TYPE (timeout, connection, ...) and,
  /// for HTTP errors, on the status code (400, 401, ...).
  static AppException map(DioException error) {
    switch (error.type) {
      // The connection attempt itself timed out.
      case DioExceptionType.connectionTimeout:
        return const ConnectionTimeoutException();

      // Timed out while sending the request body.
      case DioExceptionType.sendTimeout:
        return const SendTimeoutException();

      // Timed out while waiting for the server's response.
      case DioExceptionType.receiveTimeout:
        return const ReceiveTimeoutException();

      // Couldn't establish a connection at all — most likely no internet.
      case DioExceptionType.connectionError:
        return const NoInternetException();

      // The user cancelled the request.
      case DioExceptionType.cancel:
        return const UnknownException(message: 'Request cancelled.');

      // TLS/SSL certificate validation failed.
      case DioExceptionType.badCertificate:
        return const ServerException(message: 'Bad certificate.');

      // The server replied with a non-2xx status — map the status code.
      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response);

      // A transformation (parse/serialization) step timed out.
      case DioExceptionType.transformTimeout:
        return const ServerException(message: 'Timeout.');

      // Unknown cause. A SocketException inside usually also means "no
      // internet", so we check for it specifically.
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NoInternetException();
        }

        return const UnknownException();
    }
  }

  /// Maps an HTTP error response (status code + body) to an exception.
  static AppException _handleStatusCode(Response? response) {
    // Status code of the failed response (0 if there was none).
    final statusCode = response?.statusCode ?? 0;

    // The response body — its shape depends on the server. Most REST APIs
    // send JSON like {"message": "..."} but some send plain text, so we
    // guard with type checks before reading it (never assume).
    final data = response?.data;

    String message = 'Something went wrong';

    if (data is Map<String, dynamic> && data['message'] is String) {
      message = data['message'] as String;
    }

    switch (statusCode) {
      case 400:
        return BadRequestException(message: message);

      case 401:
        return UnauthorizedException(message: message);

      case 403:
        return ForbiddenException(message: message);

      case 404:
        return NotFoundException(message: message);

      case 409:
        return ConflictException(message: message);

      // 422 = validation error; the server may also send an `errors` map
      // describing which field failed.
      case 422:
        return ValidationException(
          message: message,
          errors: data is Map<String, dynamic> &&
                  data['errors'] is Map<String, dynamic>
              ? data['errors'] as Map<String, dynamic>
              : null,
        );

      // 5xx range: the server is at fault.
      case 500:
      case 501:
      case 502:
      case 503:
        return ServerException(message: message, statusCode: statusCode);

      // Any other code — treat it as a server error with the status.
      default:
        return ServerException(message: message, statusCode: statusCode);
    }
  }
}
