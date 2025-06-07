

import 'package:exchange_app/app/config/environment.dart';
import 'package:exchange_app/app/data/dio_api.dart';
import 'package:exchange_app/app/di/app_scope_register.dart';

final class AppScope implements IAppScope {
  @override
  final Environment env;
  @override
  final AppConfig appConfig;
  @override
  final DioApi dio;

  const AppScope({
    required this.env,
    required this.appConfig,
    required this.dio,
  });
}

/// {@macro app_scope.class}
abstract interface class IAppScope {
  /// Environment.
  Environment get env;

  /// App configuration.
  AppConfig get appConfig;

  /// Http client.
  DioApi get dio;
}
