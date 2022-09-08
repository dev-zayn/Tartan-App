import 'package:flutter/material.dart';

Widget Textsax({
  TextAlign textAlign = TextAlign.start,
  FontWeight fontWeight = FontWeight.w500,
  TextDirection? textDirection,
  double height = 1,
  double? letterSpacing,
  int maxChars = 1000,
  required String text,
  required double fontSize,
  Color? color,
}) {
  return Text(text.length > maxChars ? text.substring(0, maxChars) : text,
      textAlign: textAlign,
      textDirection: textDirection,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        height: height,
        color: color,
        fontWeight: fontWeight,
      ));
}
