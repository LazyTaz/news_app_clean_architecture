import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final Exception? exception;

  const Failure({
    required this.message,
    this.exception,
  });

  @override
  List<Object> get props => [message];
}

/// Network related failure
/// (Timeout, no internet etc.)
class NetworkFailure extends Failure {
  NetworkFailure({
    required Exception exception,
  }) : super(message: exception.toString(), exception: exception);
}

/// Api logic related failure
/// (Bad authorisation, 404 etc.)
class ApiFailure extends Failure {
  ApiFailure({
    required Exception exception,
  }) : super(message: exception.toString(), exception: exception);
}

/// Domain logic related failure
class DomainFailure extends Failure {
  // TODO
  const DomainFailure() : super(message: "Domain failure");
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super(message: "Unknown failure");
}
