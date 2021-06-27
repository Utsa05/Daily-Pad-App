import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/text/text.dart';
import 'package:daily_pad/constans/widget/bottomsheet.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:daily_pad/model/pad.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final DailyPad dailyPad;
  final GestureTapCallback onEdit;
  final GestureTapCallback onDelete;
  final GestureTapCallback onChange;
  const Item(
      {Key? key,
      required this.dailyPad,
      required this.onEdit,
      required this.onDelete,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Hero(
          tag: dailyPad.id as int,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, VIEW_PAD, arguments: dailyPad);
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 12.0, left: 13.0, right: 13.0),
              margin: EdgeInsets.only(bottom: 9.0),
              width: size.width,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //head
                  Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          sText(
                              this.dailyPad.status == 'Complete'
                                  ? 'Complete'
                                  : "Running",
                              this.dailyPad.status == 'Complete'
                                  ? successColor
                                  : orangeColor,
                              size.width * 0.042,
                              FontWeight.w600),
                          Container(
                            height: 22.0,
                            alignment: Alignment.center,
                            child: sText(
                                'View',
                                this.dailyPad.status == 'Complete'
                                    ? successColor
                                    : orangeColor,
                                12.0,
                                FontWeight.normal),
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    width: 0.7,
                                    color: this.dailyPad.status == 'Complete'
                                        ? successColor
                                        : orangeColor)),
                          )
                        ],
                      )),
                  //divider
                  Divider(
                    thickness: 1,
                    color: greylightColor.withOpacity(0.5),
                  ),
                  //body
                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(top: 3.0, bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          height: 50.0,
                          width: 2.0,
                          decoration: BoxDecoration(
                              color: this.dailyPad.status == 'Complete'
                                  ? successColor
                                  : orangeColor,
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sText(this.dailyPad.title, titleColor,
                                size.width * 0.051, FontWeight.w700),
                            lText(this.dailyPad.description, greylightColor,
                                size.width * 0.035, FontWeight.w500, 2)
                          ],
                        )),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sText(this.dailyPad.time, greylightColor, 12.0,
                            FontWeight.w600),
                        GestureDetector(
                          onTap: onChange,
                          child: Container(
                            height: 20.0,
                            alignment: Alignment.center,
                            width: 20.0,
                            child: this.dailyPad.status == 'Running'
                                ? Container()
                                : Icon(
                                    Icons.done,
                                    color: whiteColor,
                                    size: 15.0,
                                  ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                width: this.dailyPad.status == 'Running'
                                    ? 1.0
                                    : 0.0,
                                color: this.dailyPad.status == 'Complete'
                                    ? successColor
                                    : orangeColor,
                              ),
                              color: this.dailyPad.status == 'Complete'
                                  ? successColor
                                  : whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 40.0,
            right: 0.0,
            child: IconButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  cBottomSheet(context, "Choose", "Edit", 'Delete', onEdit,
                      onDelete, size);
                },
                icon: Icon(
                  Icons.more_vert,
                  color: greylightColor,
                )))
      ],
    );
  }
}
