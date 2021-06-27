import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

cButton(String title, double width, double heigth, Color color, double round,
    GestureTapCallback onTap) {
  return MaterialButton(
      height: heigth,
      minWidth: width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(round)),
      color: color,
      onPressed: onTap);
}

cOutnlineBtn(String title, double width, double heigth, Color color,
    double round, GestureTapCallback onTap) {
  return MaterialButton(
      height: heigth,
      minWidth: width,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: color),
          borderRadius: BorderRadius.circular(round)),
      color: color,
      onPressed: onTap);
}
