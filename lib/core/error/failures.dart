sealed class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailures extends Failure {
  const ServerFailures([super.message = 'Server xetasi bas verdi']);
}

class NetworkFailures extends Failure {
  const NetworkFailures([super.message = 'Server xetasi bas verdi']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Local yaddaş xətası']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Naməlum xəta baş verdi']);
}
