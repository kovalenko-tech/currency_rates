import 'package:currency_rates/common/common.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  Dio authDio(
    Config config,
    TokenInterceptor tokenInterceptor,
  ) =>
      NetworkManager.getApiDioClient(
        config: config,
        tokenInterceptor: tokenInterceptor,
      );
}
