import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:flutter/material.dart';

class DescriptionGet extends StatelessWidget {
  final TextEditingController controller;
  const DescriptionGet({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle:
                  cStyle(blackColor.withOpacity(0.4), 13.0, FontWeight.w600),
              hintText: 'Description',
            ),
          ),
          Divider(
            thickness: 1.0,
            color: greylightColor,
          )
        ],
      ),
    );
  }
}
