import 'package:exchange_app/app/design/size_config.dart';
import 'package:exchange_app/app/utils/string_extensions.dart';
import 'package:exchange_app/home/views/widgets/colored_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/asset_view_model.dart';

/// A view that displays a list of assets with their prices.
/// It uses a [ScrollController] to fetch more assets when the user scrolls to the bottom.
/// The assets are displayed in a [ListView] with a loading indicator
///  at the bottom when more assets are being fetched.
/// The view listens to the [AssetViewModel] for changes in the asset list and loading state.
/// The assets are displayed with a colored item representing each asset's color.
class AssetListView extends StatefulWidget {
  const AssetListView({super.key});

  @override
  State<AssetListView> createState() => _AssetListViewState();
}

class _AssetListViewState extends State<AssetListView> {
  /// ScrollController to manage the scrolling of the asset list.
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<AssetViewModel>(context, listen: false);
    viewModel.fetchAssets();

    /// Initialize the ScrollController and add a listener to fetch more assets
    /// when the user scrolls near the bottom of the list.
    _controller = ScrollController()
      ..addListener(() {
        if (_controller.position.pixels >=
            _controller.position.maxScrollExtent - 200) {
          viewModel.fetchAssets();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AssetViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            controller: _controller,
            itemCount:
                viewModel.currency.length + (viewModel.isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (viewModel.hasError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(viewModel.error),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                });
                return const SizedBox.shrink();
              }

              /// If the index is equal to the length of the currency list,
              /// it means we are at the loading indicator position.
              /// Lenght is not null, so we can safely use it.
              if (index >= (viewModel.currency.length)) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.w(16.0)),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final item = viewModel.currency[index];
              final color = viewModel.colors[index];

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(20.0),
                  vertical: SizeConfig.h(14.0),
                ),
                child: Row(
                  children: [
                    ColoredItem(color),
                    SizedBox(width: SizeConfig.w(16)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.symbol,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            item.priceUsd.toUsd(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
