import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class HttpFailure extends Failure {
  const HttpFailure();
}

class NoInternetFailure extends Failure {
  const NoInternetFailure();
}
