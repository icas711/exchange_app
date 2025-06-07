import 'package:exchange_app/app/design/size_config.dart';
import 'package:exchange_app/app/theme/theme.dart';
import 'package:exchange_app/home/views/asset_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    
    SizeConfig.init(context);
    final ThemeData themeData = AppTheme.light(context);
    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
        child: child ?? const SizedBox.shrink(),
      ),
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'Excechange App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', ''), Locale('en', '')],
      locale: const Locale('en', ''),
      home: AssetListView(),
    );
  }
}
