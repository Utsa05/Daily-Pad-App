import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:daily_pad/model/pad.dart';
import 'package:flutter/material.dart';

class ViewItem extends StatelessWidget {
  final DailyPad dailyPad;
  const ViewItem({Key? key, required this.dailyPad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 12.0, bottom: 12.0, left: 13.0, right: 13.0),
          margin:
              EdgeInsets.only(top: 12.0, left: 13.0, right: 13.0, bottom: 12.0),
          width: size.width,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //head
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sText(
                        this.dailyPad.status == 'Complete'
                            ? 'Complete'
                            : "Running ",
                        this.dailyPad.status == 'Complete'
                            ? successColor
                            : orangeColor,
                        size.width * 0.042,
                        FontWeight.w600),
                    sText(this.dailyPad.time, greylightColor, 10.0,
                        FontWeight.w600)
                  ],
                ),
              ),
              //divider
              Divider(
                thickness: 1,
                color: greylightColor.withOpacity(0.5),
              ),
              //body
              Container(
                width: size.width,
                margin: EdgeInsets.only(top: 3.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sText(this.dailyPad.title, titleColor, size.width * 0.051,
                        FontWeight.w700),
                    SizedBox(
                      height: 5.0,
                    ),
                    lText(this.dailyPad.description, titleColor,
                        size.width * 0.037, FontWeight.w500, 100)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
