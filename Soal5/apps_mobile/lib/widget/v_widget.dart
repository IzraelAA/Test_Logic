import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget vText(String title,
    {Color color = Colors.black,
    double fontSize,
    FontWeight fontWeight,
    TextOverflow overflow = TextOverflow.fade,
    TextAlign align,
    bool money = false,
    bool number = false,
    bool SF = true,
    height,
    decoration,
    int maxLines}) {
  return Text(
    title != null && title != "null" ? title : "",
    style: TextStyle(
      fontFamily: SF ? "SF" : null,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      height: height,
    ),
    overflow: overflow,
    textAlign: align,
    maxLines: maxLines,
  );
}
