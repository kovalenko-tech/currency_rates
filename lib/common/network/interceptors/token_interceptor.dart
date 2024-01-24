import 'package:currency_rates/common/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

export 'token_interceptor.dart';

@injectable
class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[ApiHeader.apiKey] = Env.apiKey;
    handler.next(options);
  }
}
