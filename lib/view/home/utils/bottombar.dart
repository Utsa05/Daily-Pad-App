import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:flutter/material.dart';

bottomBar(BuildContext context, String date, String month, String year,
    String mode, Size size, GestureTapCallback onTap) {
  return AppBar(
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sText(
                  date + " " + month + " " + " " + year,
                  blackColor.withOpacity(0.7),
                  size.width * .036,
                  FontWeight.w600),
              SizedBox(
                height: 3.0,
              ),
              sText(mode, titleColor, size.width * .045, FontWeight.w700)
            ],
          ),
          Hero(
            tag: 'hero',
            child: MaterialButton(
                padding: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.015)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: whiteColor, size: 15.0),
                    SizedBox(
                      width: 4.0,
                    ),
                    sText("Add Pad", whiteColor, size.width * .031,
                        FontWeight.w700)
                  ],
                ),
                height: 33.0,
                minWidth: 85.0,
                color: orangeColor,
                onPressed:onTap)
          )
        ],
      ));
}
