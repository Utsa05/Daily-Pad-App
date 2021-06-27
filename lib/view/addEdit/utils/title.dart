import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/decoration.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:flutter/material.dart';

class TitleGet extends StatefulWidget {
  final TextEditingController controller;
  const TitleGet({Key? key, required  this.controller}) : super(key: key);

  @override
  _TitleGetState createState() => _TitleGetState();
}

class _TitleGetState extends State<TitleGet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.0),
          height: 27.0,
          width: 1.5,
          decoration: cDocuration(greylightColor, 5.0),
        ),
        Expanded(
            child: Container(
          height: 35.0,
          child: TextField(
            controller:widget.controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintStyle:
                    cStyle(blackColor.withOpacity(0.4), 13.0, FontWeight.w600),
                hintText: 'Your Pad Name',
                border: InputBorder.none),
          ),
        ))
      ],
    );
  }
}
