import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:flutter/material.dart';

cBottomSheet(BuildContext context, String title, String bEdit, String bDelete,
    GestureTapCallback edit, GestureTapCallback delete, Size size) {
  return showModalBottomSheet(
      backgroundColor: bgColor,
      elevation: 0.0,
      context: context,
      builder: (context) {
        return Container(
          height: 80.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(width: 1.0, color: orangeColor)),
                margin: EdgeInsets.only(top: 5.0),
                child: sText("Choose", orangeColor, 12.0, FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.015)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, color: whiteColor, size: 15.0),
                          SizedBox(
                            width: 4.0,
                          ),
                          sText(bEdit, whiteColor, size.width * .031,
                              FontWeight.w700)
                        ],
                      ),
                      height: 28.0,
                      minWidth: 85.0,
                      color: orangeColor,
                      onPressed: edit),
                  MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.015)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.delete_outline,
                              color: whiteColor, size: 15.0),
                          SizedBox(
                            width: 4.0,
                          ),
                          sText(bDelete, whiteColor, size.width * .031,
                              FontWeight.w700)
                        ],
                      ),
                      height: 28.0,
                      minWidth: 85.0,
                      color: orangeColor,
                      onPressed: delete)
                ],
              )
            ],
          ),
        );
      });
}
