import 'dart:core';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class CException with EquatableMixin implements Exception {
  CException(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class CNetworkException extends CException implements DioException {
  CNetworkException(
    String message, {
    required this.requestOptions,
    required this.type,
    required this.stackTrace,
    this.error,
    this.response,
  }) : super(message);

  @override
  dynamic error;

  @override
  RequestOptions requestOptions;

  @override
  Response? response;

  @override
  StackTrace stackTrace;

  @override
  DioExceptionType type;

  DioException copyWith({
    RequestOptions? requestOptions,
    Response? response,
    DioExceptionType? type,
    Object? error,
    StackTrace? stackTrace,
    String? message,
  }) {
    return CNetworkException(
      message ?? this.message,
      requestOptions: requestOptions ?? this.requestOptions,
      type: type ?? this.type,
      error: error ?? this.error,
      response: response ?? this.response,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }
}

class CConnectionException extends CNetworkException {
  CConnectionException(
    String message, {
    required RequestOptions requestOptions,
    required DioExceptionType type,
    StackTrace? stackTrace,
  }) : super(
          message,
          requestOptions: requestOptions,
          type: type,
          stackTrace: identical(stackTrace, StackTrace.empty)
              ? requestOptions.sourceStackTrace ?? StackTrace.current
              : stackTrace ?? requestOptions.sourceStackTrace ?? StackTrace.current,
        );
}

class CParseException extends CException {
  CParseException(String message) : super(message);
}

class CUnexpectedStateException extends CException {
  CUnexpectedStateException(String message) : super(message);
}

class CInputException extends CException {
  CInputException(String message) : super(message);
}

class CUnknownException extends CException {
  CUnknownException(String message) : super(message);
}

class CLocalDBException extends CException {
  CLocalDBException(String message) : super(message);
}

class CInvalidException extends CException {
  CInvalidException(String message) : super(message);
}
