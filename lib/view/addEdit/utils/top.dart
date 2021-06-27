import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:flutter/material.dart';

class TopSide extends StatelessWidget {
  final bool isAdd;
  const TopSide({Key? key,required this.isAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Stack(
                children: [
                  Column(
                    children: [
                      AppBar(
                        leading: Icon(Icons.arrow_back, color: orangeColor),
                        iconTheme: IconThemeData(color: whiteColor),
                        elevation: 0.0,
                        backgroundColor: orangeColor,
                        title: sText(isAdd ? 'Add Pad' : 'Edit Pad', whiteColor,
                            size.width * 0.05, FontWeight.bold),
                      ),
                      SizedBox(height: 20.0)
                    ],
                  ),
                  Positioned(
                    top: -70.0,
                    left: -100.0,
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 70.0, color: whiteColor.withOpacity(0.1))),
                    ),
                  ),
                  Positioned(
                    top: 27.5,
                    left: 5.5,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        )),
                  ),
                ],
              );
  }
}
