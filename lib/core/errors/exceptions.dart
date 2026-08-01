/// Base Exception
sealed class AppException implements Exception {
  final String message;

  const AppException({required this.message});

  @override
  String toString() => message;
}

/// ===============================
/// Network
/// ===============================

final class NoInternetException extends AppException {
  const NoInternetException({super.message = 'No internet connection.'});
}

final class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException({super.message = 'Connection timeout.'});
}

final class ReceiveTimeoutException extends AppException {
  const ReceiveTimeoutException({super.message = 'Receive timeout.'});
}

final class SendTimeoutException extends AppException {
  const SendTimeoutException({super.message = 'Send timeout.'});
}

/// ===============================
/// Server
/// ===============================

final class ServerException extends AppException {
  final int? statusCode;

  const ServerException({required super.message, this.statusCode});
}

final class BadRequestException extends AppException {
  const BadRequestException({super.message = 'Bad request.'});
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException({super.message = 'Unauthorized.'});
}

final class ForbiddenException extends AppException {
  const ForbiddenException({super.message = 'Forbidden.'});
}

final class NotFoundException extends AppException {
  const NotFoundException({super.message = 'Resource not found.'});
}

final class ConflictException extends AppException {
  const ConflictException({super.message = 'Conflict.'});
}

final class ValidationException extends AppException {
  final Map<String, dynamic>? errors;

  const ValidationException({required super.message, this.errors});
}

final class InternalServerException extends AppException {
  const InternalServerException({super.message = 'Internal server error.'});
}

/// ===============================
/// Auth
/// ===============================

final class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException({super.message = 'Invalid credentials.'});
}

final class TokenExpiredException extends AppException {
  const TokenExpiredException({super.message = 'Token expired.'});
}

/// ===============================
/// Local Storage
/// ===============================

final class CacheException extends AppException {
  const CacheException({super.message = 'Cache error.'});
}

final class StorageException extends AppException {
  const StorageException({super.message = 'Storage error.'});
}

/// ===============================
/// Unknown
/// ===============================

final class UnknownException extends AppException {
  const UnknownException({super.message = 'Unknown error.'});
}
