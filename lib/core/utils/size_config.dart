import 'package:flutter/material.dart';

class AppSize {
  static const double figmaHeight = 744.0;
  static const double figmaWidth = 1133.0;

  static BuildContext? _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static void _checkContext() {
    if (_context == null) {
      throw Exception(
          'AppSize not initialized. Call AppSize.init(context) first.');
    }
  }

  static bool get isLandscape {
    _checkContext();
    return MediaQuery.of(_context!).size.height <
        MediaQuery.of(_context!).size.width;
  }

  static double width(double width) {
    _checkContext();
    return isLandscape
        ? MediaQuery.of(_context!).size.width * width / figmaWidth
        : MediaQuery.of(_context!).size.height * width / figmaHeight;
  }

  static double height(double height) {
    _checkContext();
    return isLandscape
        ? MediaQuery.of(_context!).size.height * height / figmaHeight
        : MediaQuery.of(_context!).size.width * height / figmaWidth;
  }
}
