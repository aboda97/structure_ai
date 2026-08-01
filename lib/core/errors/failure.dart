sealed class Failure {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => message;
}

/// Network

final class NoInternetFailure extends Failure {
  const NoInternetFailure({super.message = 'No internet connection.'});
}

final class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message = 'Connection timeout.'});
}

/// Server

final class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

final class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message = 'Bad request.'});
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = 'Unauthorized.'});
}

final class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.message = 'Forbidden.'});
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Not found.'});
}

final class ConflictFailure extends Failure {
  const ConflictFailure({super.message = 'Conflict.'});
}

final class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}

/// Local

final class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error.'});
}

/// Unknown

final class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Something went wrong.'});
}
