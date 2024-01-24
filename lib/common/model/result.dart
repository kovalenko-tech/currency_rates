import 'dart:async';

import 'package:currency_rates/common/network/network.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = ResultSuccess<T>;

  const factory Result.failed({
    required String message,
    required CException exception,
    StackTrace? stackTrace,
  }) = ResultFailure<T>;
}

void combine3<T1, T2, T3>(
  Result<T1> result1,
  Result<T2> result2,
  Result<T3> result3, {
  required void Function(T1, T2, T3) success,
  required void Function(String, CException, StackTrace?) failed,
}) {
  result1.when(
    success: (result1) {
      result2.when(
        success: (result2) {
          result3.when(
            success: (result3) {
              success(result1, result2, result3);
            },
            failed: failed,
          );
        },
        failed: failed,
      );
    },
    failed: failed,
  );
}

void combine2<T1, T2>(
  Result<T1> result1,
  Result<T2> result2, {
  required void Function(T1, T2) success,
  required void Function(String, CException, StackTrace?) failed,
}) {
  result1.when(
    success: (result1) {
      result2.when(
        success: (result2) {
          success(result1, result2);
        },
        failed: failed,
      );
    },
    failed: failed,
  );
}

extension ResultExt<T> on Result<T> {
  Future<Result<R>> foldAsync<R>(
    FutureOr<Result<R>> Function(T data) map,
  ) async =>
      this.map(
        success: (success) async => map(success.data),
        failed: (failed) async => Result.failed(
          message: failed.message,
          exception: failed.exception,
          stackTrace: failed.stackTrace,
        ),
      );
}
