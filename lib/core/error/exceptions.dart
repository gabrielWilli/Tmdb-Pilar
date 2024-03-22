import 'package:equatable/equatable.dart';

sealed class ExceptionImpl extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class HttpException extends ExceptionImpl {
  HttpException({
    this.statusCode,
    this.responseMessage,
    this.exception,
  });

  final int? statusCode;
  final String? responseMessage;
  final Exception? exception;
}

class NoInternetException implements Exception {}
