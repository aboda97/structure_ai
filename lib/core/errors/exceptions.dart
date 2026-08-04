// ============================================================
// App-level exception types (domain errors).
//
// Why a custom hierarchy instead of throwing raw DioException everywhere?
// Because feature code should NOT know anything about the Dio library. We
// translate every low-level error into one of these "AppException" types,
// so the rest of the app works with a stable, library-agnostic vocabulary.
//
// `sealed` means the compiler knows every possible subtype, which lets us
// write exhaustive switches over them.
// ============================================================

/// Base of every app exception. Carries a human-readable message.
/// `sealed` + `implements Exception` makes every subclass a real Dart
/// exception that can be `throw`n and `catch`ed.
sealed class AppException implements Exception {
  final String message;

  const AppException({required this.message});

  @override
  String toString() => message;
}

// ===============================
// Network — transport-level failures (no bytes left the device).
// ===============================

/// The device has no internet connection at all.
final class NoInternetException extends AppException {
  const NoInternetException({super.message = 'No internet connection.'});
}

/// Could not establish a connection within the timeout window.
final class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException({super.message = 'Connection timeout.'});
}

/// The server took too long to send its response.
final class ReceiveTimeoutException extends AppException {
  const ReceiveTimeoutException({super.message = 'Receive timeout.'});
}

/// The client took too long to send the request body.
final class SendTimeoutException extends AppException {
  const SendTimeoutException({super.message = 'Send timeout.'});
}

// ===============================
// Server — the server answered, but with an HTTP error status.
// ===============================

/// Generic server-side failure; optionally carries the HTTP status code.
final class ServerException extends AppException {
  final int? statusCode;

  const ServerException({required super.message, this.statusCode});
}

/// 400 Bad Request — the request itself was malformed.
final class BadRequestException extends AppException {
  const BadRequestException({super.message = 'Bad request.'});
}

/// 401 Unauthorized — missing or invalid credentials.
final class UnauthorizedException extends AppException {
  const UnauthorizedException({super.message = 'Unauthorized.'});
}

/// 403 Forbidden — authenticated but not allowed to access this resource.
final class ForbiddenException extends AppException {
  const ForbiddenException({super.message = 'Forbidden.'});
}

/// 404 Not Found — the resource does not exist.
final class NotFoundException extends AppException {
  const NotFoundException({super.message = 'Resource not found.'});
}

/// 409 Conflict — the request conflicts with the current server state.
final class ConflictException extends AppException {
  const ConflictException({super.message = 'Conflict.'});
}

/// 422 Unprocessable Entity — validation failed. Optionally carries the
/// map of field errors sent by the server.
final class ValidationException extends AppException {
  final Map<String, dynamic>? errors;

  const ValidationException({required super.message, this.errors});
}

/// 5xx — a bug or outage on the server side.
final class InternalServerException extends AppException {
  const InternalServerException({super.message = 'Internal server error.'});
}

// ===============================
// Auth — login/token related problems.
// ===============================

/// The email/password combination is wrong.
final class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException({super.message = 'Invalid credentials.'});
}

/// The access token has expired and needs a refresh.
final class TokenExpiredException extends AppException {
  const TokenExpiredException({super.message = 'Token expired.'});
}

// ===============================
// Local Storage — problems reading/writing on the device.
// ===============================

/// Generic cache failure (e.g. nothing cached or the cache is corrupt).
final class CacheException extends AppException {
  const CacheException({super.message = 'Cache error.'});
}

/// Failure while accessing secure/shared storage on the device.
final class StorageException extends AppException {
  const StorageException({super.message = 'Storage error.'});
}

// ===============================
// Unknown — fallback for anything we didn't predict.
// ===============================

final class UnknownException extends AppException {
  const UnknownException({super.message = 'Unknown error.'});
}
