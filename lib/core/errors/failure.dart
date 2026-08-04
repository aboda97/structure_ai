// ============================================================
// Failure types — the "user-facing" mirror of AppException.
//
// Why both exceptions AND failures? Clean Architecture separates layers:
//   - Exceptions are for the DATA layer (what the API/storage throws).
//   - Failures are for the PRESENTATION layer (what the UI reads).
// A Cubit catches an exception, converts it to a Failure, and exposes the
// Failure in its state — so the UI never has to catch exceptions.
//
// `sealed` lets the UI `switch` over every failure exhaustively, so the
// compiler guarantees all cases are handled.
// ============================================================

/// Base class of all failures; every one carries a message for the user.
sealed class Failure {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => message;
}

// Network

/// No internet connection.
final class NoInternetFailure extends Failure {
  const NoInternetFailure({super.message = 'No internet connection.'});
}

/// The request timed out.
final class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message = 'Connection timeout.'});
}

// Server

/// Generic server error (message usually comes from the server itself).
final class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

/// 400 — the request itself was wrong.
final class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message = 'Bad request.'});
}

/// 401 — not logged in / bad credentials / token expired.
final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = 'Unauthorized.'});
}

/// 403 — logged in but not allowed.
final class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.message = 'Forbidden.'});
}

/// 404 — resource not found.
final class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Not found.'});
}

/// 409 — conflict with the current state.
final class ConflictFailure extends Failure {
  const ConflictFailure({super.message = 'Conflict.'});
}

/// 422 — validation failed; the message tells the user what to fix.
final class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}

// Local

/// Failed to read/write the local cache.
final class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error.'});
}

// Unknown

/// Catch-all for anything we didn't map explicitly.
final class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Something went wrong.'});
}
