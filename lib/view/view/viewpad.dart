import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/text/text.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:daily_pad/model/pad.dart';
import 'package:daily_pad/view/view/utils/item.dart';
import 'package:flutter/material.dart';

class ViewPad extends StatefulWidget {
  final DailyPad dailyPad;
  const ViewPad({Key? key, required this.dailyPad}) : super(key: key);

  @override
  _ViewPadState createState() => _ViewPadState();
}

class _ViewPadState extends State<ViewPad> {
  @override
  void initState() {
    print(widget.dailyPad.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: widget.dailyPad.id as int,
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0.0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              iconTheme: IconThemeData(
                  color: widget.dailyPad.status == 'Complete'
                      ? successColor
                      : orangeColor),
              title: sText(
                  "View Pad",
                  widget.dailyPad.status == 'Complete'
                      ? successColor
                      : orangeColor,
                  size.width * 0.045,
                  FontWeight.bold),
              actions: [
                Container(
                    padding:
                        EdgeInsets.only(top: 14.0, bottom: 14.0, right: 6.0),
                    margin: EdgeInsets.only(right: 8.0),
                    height: 30.0,
                    child: MaterialButton(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.download, color: whiteColor, size: 15.0),
                            SizedBox(
                              width: 4.0,
                            ),
                            sText("PDF", whiteColor, size.width * .031,
                                FontWeight.w700)
                          ],
                        ),
                        minWidth: 65.0,
                        color: widget.dailyPad.status == 'Complete'
                            ? successColor
                            : orangeColor,
                        onPressed: () {
                          Navigator.pushNamed(context, ADD_VIEW);
                        }))
              ],
            ),
            ViewItem(dailyPad: widget.dailyPad)
          ],
        ),
      ),
    );
  }
}
