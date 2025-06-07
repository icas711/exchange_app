import 'package:exchange_app/app/design/size_config.dart';
import 'package:flutter/material.dart';

/// A class that provides light and dark themes for the app.
/// It uses the [SizeConfig] to set text sizes and other dimensions based on the screen size.
/// This class defines the overall look and feel of the app, including colors, fonts, and styles.
/// The themes can be accessed using the static methods [light] and [dark].
class AppTheme {
  static ThemeData  light(BuildContext context) => _createLightTheme(context);
  static ThemeData  dark(BuildContext context) => _createDarkTheme(context);

  static ThemeData _createLightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Color(0xFF17171A),
          fontSize: SizeConfig.h(17),
          fontWeight: FontWeight.w600,
          letterSpacing: SizeConfig.w(-0.41),
          height: SizeConfig.h(24 / 17),
          fontFamily: 'SFProText'
        ),
      ),
    );
  }

  static ThemeData _createDarkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Color(0xFF17171A),
          fontSize: SizeConfig.h(17),
          fontWeight: FontWeight.w600,
          letterSpacing: SizeConfig.w(-0.41),
          height: SizeConfig.h(24 / 17),
          fontFamily: 'SFProText'
        ),
      ),
    );
  }
}
