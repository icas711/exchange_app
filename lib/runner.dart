import 'package:exchange_app/app/config/environment.dart';
import 'package:exchange_app/app/di/app_scope_register.dart';
import 'package:exchange_app/app_flow.dart';
import 'package:flutter/material.dart';

/// Initializes the Flutter binding and DI.
/// Then runs the app with the provided [Environment].
Future<void> run(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  const scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope(env);
  runApp(AppFlow(appScope: scope));
}
