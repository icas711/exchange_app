import 'package:exchange_app/app/data/dio_api.dart';
import 'package:exchange_app/app/data/service_result.dart';
import 'package:exchange_app/app/error/network_exceptions.dart';
import 'package:exchange_app/home/models/currency.dart';

import '../models/asset_model.dart';

/// This service handles API calls related to assets.
/// It uses the DioApi class to make HTTP requests and returns a list of Asset objects.
class ApiService {
  final DioApi dioApi;
  ApiService(this.dioApi);

  /// Fetches a list of assets from the API with optional pagination.
  /// [limit] specifies the maximum number of assets to fetch,
  /// and [offset] specifies the starting point for pagination.
  /// Returns a list of Asset objects.
  Future<ServiceResult<List<Currency>>> fetchAssets({
    int limit = 15,
    int offset = 0,
  }) async {
    try {
      final response = await dioApi.read(
        'assets',
        queryParameters: {'limit': limit, 'offset': offset},
      );
      final asset=Asset.fromMap(response.data);
      return ServiceResult(content: asset.data);
    } catch (e) {
      final NetworkExceptions networkException =
          NetworkExceptions.getDioException(e);
      return ServiceResult(
        error: NetworkExceptions.getErrorMessage(networkException),
      );
    }
  }
}
