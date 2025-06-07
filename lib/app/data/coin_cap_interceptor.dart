import 'package:dio/dio.dart';

/// Interceptor to add the API key to requests for CoinCap API.
/// The API key is added as a query parameter named 'apiKey'.
class CoinCapInterceptor extends Interceptor {
  final String apiKey;

  CoinCapInterceptor(this.apiKey);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add apiKey as a query parameter
    options.queryParameters['apiKey'] = apiKey;
    super.onRequest(options, handler);
  }
}
