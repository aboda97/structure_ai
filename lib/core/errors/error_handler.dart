import 'exceptions.dart';
import 'failure.dart';

// ============================================================
// Converts an AppException (from the data layer) into a Failure
// (for the presentation layer).
//
// Together with DioErrorMapper this forms the complete error pipeline:
//
//   DioException ──(DioErrorMapper)──► AppException
//                                     ──(ErrorHandler)──► Failure ──► UI
// ============================================================

final class ErrorHandler {
  const ErrorHandler._();

  /// Maps ANY exception to its corresponding Failure. The `switch` over a
  /// `sealed` type is exhaustive: any new AppException forces us to decide
  /// what failure it maps to (the compiler will complain if we forget).
  static Failure handle(Object error) {
    return switch (error) {
      // Offline: tell the user there is no internet.
      NoInternetException() => const NoInternetFailure(),

      // All three timeout types share one Failure.
      ConnectionTimeoutException() ||
      ReceiveTimeoutException() ||
      SendTimeoutException() => const TimeoutFailure(),

      // Auth problems all mean "the user isn't (validly) logged in".
      UnauthorizedException() ||
      InvalidCredentialsException() ||
      TokenExpiredException() => const UnauthorizedFailure(),

      ForbiddenException() => const ForbiddenFailure(),

      NotFoundException() => const NotFoundFailure(),

      ConflictException() => const ConflictFailure(),

      BadRequestException() => const BadRequestFailure(),

      // Validation keeps the server's message (it tells the user what to
      // fix), so we pass it through.
      ValidationException(:final message) => ValidationFailure(
        message: message,
      ),

      CacheException() => const CacheFailure(),

      // Server errors keep their message too.
      ServerException(:final message) => ServerFailure(message: message),

      InternalServerException(:final message) => ServerFailure(message: message),

      // Default: any unmapped exception becomes a generic failure rather
      // than crashing the UI.
      _ => const UnknownFailure(),
    };
  }
}
