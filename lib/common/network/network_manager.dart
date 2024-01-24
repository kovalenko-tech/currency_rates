import 'package:dio/dio.dart';
import 'package:currency_rates/common/common.dart';

class NetworkManager {
  NetworkManager._();

  static Dio getApiDioClient({
    required Config config,
    TokenInterceptor? tokenInterceptor,
  }) =>
      _getDioClient(
        baseUrl: Uri.parse(config.baseUrl),
        tokenInterceptor: tokenInterceptor,
      );

  static Dio _getDioClient({
    required Uri baseUrl,
    Duration connectTimeout = const Duration(seconds: 20),
    Duration receiveTimeout = const Duration(seconds: 20),
    Duration sendTimeout = const Duration(seconds: 20),
    List<Interceptor> interceptors = const [],
    String? contentType,
    TokenInterceptor? tokenInterceptor,
  }) {
    final options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      contentType: contentType,
    )..baseUrl = baseUrl.toString();

    final dio = Dio(options);

    dio.interceptors.addAll(interceptors);

    if (tokenInterceptor != null) {
      dio.interceptors.add(tokenInterceptor);
    }

    return dio;
  }
}
