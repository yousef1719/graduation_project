import 'package:flutter/material.dart';

class Styles {
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  Styles({this.fontWeight, required this.color, required this.fontSize});

  TextStyle get textStyleInter => TextStyle(
        fontFamily: 'Inter',
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        decoration: TextDecoration.none,
      );
  TextStyle get textStyleTrad => TextStyle(
        fontFamily: 'Traditional Arabic',
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        decoration: TextDecoration.none,
      );
}
