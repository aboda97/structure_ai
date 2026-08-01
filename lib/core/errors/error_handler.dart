import 'exceptions.dart';
import 'failure.dart';

final class ErrorHandler {
  const ErrorHandler._();

  static Failure handle(Object error) {
    return switch (error) {
      NoInternetException() => const NoInternetFailure(),

      ConnectionTimeoutException() ||
      ReceiveTimeoutException() ||
      SendTimeoutException() => const TimeoutFailure(),

      UnauthorizedException() ||
      InvalidCredentialsException() => const UnauthorizedFailure(),

      ForbiddenException() => const ForbiddenFailure(),

      NotFoundException() => const NotFoundFailure(),

      ConflictException() => const ConflictFailure(),

      ValidationException(:final message) => ValidationFailure(
        message: message,
      ),

      CacheException() => const CacheFailure(),

      ServerException(:final message) => ServerFailure(message: message),

      _ => const UnknownFailure(),
    };
  }
}
