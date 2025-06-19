import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth, screenHeight, defaultWidth, defaultHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    defaultHeight = 854;
    defaultWidth = 320;
  }

  static double scaleWidth(double inputWidth) {
    return (inputWidth / defaultWidth) * screenWidth;
  }

  static double scaleHeight(double inputHeight) {
    return (inputHeight / defaultHeight) * screenHeight;
  }
}
