import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleWidth;
  static late double scaleHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    scaleWidth = screenWidth / 375; // ширина из Figma
    scaleHeight = screenHeight / 812; // высота из Figma
  }

  static double w(double inputWidth) => inputWidth * scaleWidth;
  static double h(double inputHeight) => inputHeight * scaleHeight;
  static double f(double inputFontSize) => inputFontSize * scaleWidth;
}