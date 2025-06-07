// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A class that provides methods to interact with a REST API using Dio.
/// It includes methods for reading data from a specified path,
///  and placeholders for creating, updating, and deleting data.
class DioApi {
  const DioApi(this.dio);

  /// The Dio instance used for making HTTP requests.
  final Dio dio;

  Future<Response<dynamic>> read(
    /// Reads data from the specified path.
    String path, {

    /// Optional query parameters to be included in the request.
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> create() async {
    throw UnimplementedError('Create method is not implemented');
  }

  Future update() async {
    throw UnimplementedError('Update method is not implemented');
  }

  Future delete() async {
    throw UnimplementedError('Delete method is not implemented');
  }
}
