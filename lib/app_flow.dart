import 'package:exchange_app/app.dart';
import 'package:exchange_app/app/di/app_scope.dart';
import 'package:exchange_app/app/di/di_scope.dart';
import 'package:exchange_app/home/view_models/asset_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppFlow extends StatelessWidget {
  const AppFlow({required this.appScope, super.key});

  final IAppScope appScope;

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      factory: (_) => appScope,
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AssetViewModel(appScope.dio))],
        child: const App(),
      ),
    );
  }
}
