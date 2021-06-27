import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

cDialog(
  BuildContext context,
  String title,
  String subTitle,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)), //this right here
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
            height: 160.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: sText(title, orangeColor, 18.0, FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child:
                      lText(subTitle, successColor, 13.0, FontWeight.w600, 3),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                      minWidth: 65.0,
                      height: 26.0,
                      padding: EdgeInsets.all(0.0),
                      child: sText('Close', whiteColor, 14.0, FontWeight.w600),
                      color: orangeColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        );
      });
}

asdkDialog(BuildContext context, String title, String subTitle,
    GestureTapCallback onTap) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)), //this right here
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
            height: 160.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: sText(title, orangeColor, 18.0, FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child:
                      lText(subTitle, successColor, 13.0, FontWeight.w600, 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                        minWidth: 65.0,
                        height: 26.0,
                        padding: EdgeInsets.all(0.0),
                        child: sText('Yes', whiteColor, 14.0, FontWeight.w600),
                        color: successColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onPressed: onTap),
                    SizedBox(
                      width: 20.0,
                    ),
                    MaterialButton(
                        minWidth: 65.0,
                        height: 26.0,
                        padding: EdgeInsets.all(0.0),
                        child: sText('No', whiteColor, 14.0, FontWeight.w600),
                        color: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
