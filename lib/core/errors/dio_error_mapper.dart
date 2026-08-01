import 'dart:io';
import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

abstract final class DioErrorMapper {
  const DioErrorMapper._();

  static AppException map(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ConnectionTimeoutException();

      case DioExceptionType.sendTimeout:
        return const SendTimeoutException();

      case DioExceptionType.receiveTimeout:
        return const ReceiveTimeoutException();

      case DioExceptionType.connectionError:
        return const NoInternetException();

      case DioExceptionType.cancel:
        return const UnknownException(message: 'Request cancelled.');

      case DioExceptionType.badCertificate:
        return const ServerException(message: 'Bad certificate.');

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response);

      case DioExceptionType.transformTimeout:
        return const ServerException(message: 'Timeout.');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NoInternetException();
        }

        return const UnknownException();
    }
  }

  static AppException _handleStatusCode(Response? response) {
    final statusCode = response?.statusCode ?? 0;

    final message =
        response?.data?['message']?.toString() ?? 'Something went wrong';

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

      case 422:
        return ValidationException(
          message: message,
          errors: response?.data["errors"],
        );

      case 500:
      case 501:
      case 502:
      case 503:
        return ServerException(message: message, statusCode: statusCode);

      default:
        return ServerException(message: message, statusCode: statusCode);
    }
  }
}
