import 'package:exchange_app/home/view_models/asset_view_model.dart';
import 'package:flutter/material.dart';

class AssetViewModelProvider extends InheritedWidget {
  final AssetViewModel viewModel;

  const AssetViewModelProvider({
    super.key,
    required this.viewModel,
    required super.child,
  });

  static AssetViewModel of(BuildContext context) {
    final AssetViewModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<AssetViewModelProvider>();
    assert(result != null, 'No AssetViewModelProvider found in context');
    return result!.viewModel;
  }

  @override
  bool updateShouldNotify(AssetViewModelProvider oldWidget) {
    return viewModel != oldWidget.viewModel;
  }
}
