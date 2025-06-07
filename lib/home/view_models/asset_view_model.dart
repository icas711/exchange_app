import 'dart:math';

import 'package:exchange_app/app/data/dio_api.dart';
import 'package:exchange_app/home/models/currency.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

/// A view model for managing the state of assets in the application.
/// It fetches assets from the API and provides them to the UI.
class AssetViewModel extends ChangeNotifier {
  AssetViewModel(DioApi dio) : _apiService = ApiService(dio);

  /// Creates an instance of [AssetViewModel] with the provided [DioApi].
  /// It initializes the API service and sets up the initial state.
  final ApiService _apiService;

  /// A list of currencies representing the assets.
  final List<Currency> _currency = [];

  /// A list of colors corresponding to each asset.
  final List<Color> _colors = [];

  /// A random number generator used to generate random colors.
  final Random _random = Random();

  /// The offset for pagination when fetching assets.
  int _offset = 0;

  /// A boolean indicating whether assets are currently being loaded.
  bool _isLoading = false;

  /// Returns the list of currencies (assets).
  List<Currency> get currency => _currency;

  /// Returns the list of colors corresponding to the assets.
  List<Color> get colors => _colors;

  /// Returns whether assets are currently being loaded.
  bool get isLoading => _isLoading;

  /// A private variable to hold the error message if an error occurs during asset fetching.
  String _error = '';

  /// Returns the error message if an error occurred during asset fetching.
  bool get hasError => _error.isNotEmpty;
  String get error => _error;

  Future<void> fetchAssets() async {
    _error = '';
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final res = await _apiService.fetchAssets(offset: _offset);
    if (res.success) {
      _currency.addAll(res.content!);
      _colors.addAll(List.generate(res.content!.length, (_) => _randomColor()));
      _offset += res.content!.length;
    } else {
      _error = res.error;
    }

    _isLoading = false;
    notifyListeners();
  }

  Color _randomColor() {
    final value = _random.nextInt(0xFFFFFF);
    return Color(0xFF000000 | value).withAlpha(26);
  }
}
