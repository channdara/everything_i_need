import 'package:flutter/material.dart';

class EinMediaQuery {
  EinMediaQuery._();

  static double _height = 0.0;
  static double _width = 0.0;
  static double _top = 0.0;
  static double _bottom = 0.0;

  static void initialize(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    _height = size.height;
    _width = size.width;
    _top = padding.top;
    _bottom = padding.bottom;
  }

  static void dispose() {
    _height = 0.0;
    _width = 0.0;
    _top = 0.0;
    _bottom = 0.0;
  }

  static double screenHeight([double percentage = 1.0]) => _height * percentage;

  static double screenWidth([double percentage = 1.0]) => _width * percentage;

  static double paddingTop([double extra = 0.0]) => _top + extra;

  static double paddingBottom([double extra = 0.0]) => _bottom + extra;

  static EdgeInsets paddingWithTop([double padding = 16.0]) =>
      EdgeInsets.fromLTRB(padding, paddingTop(padding), padding, padding);

  static EdgeInsets paddingWithBottom([double padding = 16.0]) =>
      EdgeInsets.fromLTRB(padding, padding, padding, paddingBottom(padding));

  static EdgeInsets paddingWithVertical([double padding = 16.0]) =>
      EdgeInsets.fromLTRB(
        padding,
        paddingTop(padding),
        padding,
        paddingBottom(padding),
      );
}
