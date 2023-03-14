import 'package:flutter/cupertino.dart';

Widget commonText(
    {String text = 'Enter text',
    FontWeight fontWeight,
    FontStyle fontStyle,
    TextAlign textAlign,
    Color color = CupertinoColors.black,
    EdgeInsetsGeometry padding,
    TextDecoration decoration,
    double fontSize}) {
  return Container(
    padding: padding ?? EdgeInsets.all(0),
    child: Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          decoration: decoration,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize),
    ),
  );
}
