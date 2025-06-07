import 'package:dio/dio.dart';
import 'package:exchange_app/app/config/environment.dart';
import 'package:exchange_app/app/data/coin_cap_interceptor.dart';
import 'package:exchange_app/app/data/dio_api.dart';
import 'package:exchange_app/app/di/app_scope.dart';
import 'package:exchange_app/app/env/env.dart';
import 'package:flutter/foundation.dart';

final class AppScopeRegister {
  const AppScopeRegister();

  Future<IAppScope> createScope(Environment env) async {
    // 1. Application configuration
    final appConfig = _createAppConfig(env);

    // 2. Get an api key from the environment
    final apiKey = Env.key;

    // 3. Create Dio client with the base URL from the app config
    final dio = _createDioClient(appConfig.url);

    // 4. Add interceptors to Dio
    dio.interceptors.addAll([CoinCapInterceptor(apiKey)]);

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          responseBody: true,
          requestBody: true,
        ),
      );
    }
    // 8. Create and return the AppScope instance
    // The AppScope instance contains the environment, app configuration, and Dio client.
    final dioApi = DioApi(dio);

    return AppScope(env: env, appConfig: appConfig, dio: dioApi);
  }

  Dio _createDioClient(String baseUrl) {
    const timeout = Duration(seconds: 30);

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        validateStatus: (status) {
          return status! < 500; // do not throw exceptions 401/403
        },
      ),
    );

    return dio;
  }

  AppConfig _createAppConfig(Environment env) {
    return AppConfig(url: env.buildType.defaultUrl);
  }
}

class AppConfig {
  /// Server url.
  final String url;

  /// Proxy url.
  final String? proxyUrl;

  /// Creates an instance of [AppConfig].
  /// @param url The base URL for the application.
  /// @param proxyUrl Optional proxy URL for the application.
  const AppConfig({required this.url, this.proxyUrl});
}
