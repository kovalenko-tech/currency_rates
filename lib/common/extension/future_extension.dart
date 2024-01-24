import 'package:currency_rates/common/model/model.dart';
import 'package:currency_rates/common/network/network.dart';

extension FutureToResultExtension<T> on Future<T> {
  Future<Result<R>> toResult<R>({R Function(T value)? mapper}) async {
    try {
      if (mapper != null) {
        return Result<R>.success(data: mapper(await this));
      } else if (R is T) {
        return Result<R>.success(data: await this as R);
      } else {
        return Result<R>.failed(
          message: 'Result type exception',
          exception: CUnknownException(''),
        );
      }
    } on CNetworkException catch (e, st) {
      return Result<R>.failed(
        message: e.message,
        exception: e,
        stackTrace: st,
      );
    } on CException catch (e, st) {
      return Result<R>.failed(message: e.message, exception: e, stackTrace: st);
    } on Object catch (e, st) {
      return Result<R>.failed(
        message: e.toString(),
        exception: CUnknownException(e.toString()),
        stackTrace: st,
      );
    }
  }
}
