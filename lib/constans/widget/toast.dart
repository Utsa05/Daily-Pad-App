import 'package:daily_pad/constans/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

cToast(String title, Color color) {
  return Fluttertoast.showToast(
    msg: title,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color,
    textColor: whiteColor,
  );
}
