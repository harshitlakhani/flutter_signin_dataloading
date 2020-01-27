import 'dart:ui';

import 'package:flutter/material.dart';

Color pink = Colors.pink[600];
Color purple = Colors.deepPurple[600];
Color normalfontcolor = Colors.black;

double mediumfont = 22;
double smallfont = 16;
double largefont =30;


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}