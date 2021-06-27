import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleUtil extends StatelessWidget {
  const TitleUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _launchURL() async {
    //   const url = 'https://google.com';
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sText(
                  "Daily Pad", titleColor, size.width * .055, FontWeight.w700),
              GestureDetector(
                onTap: () async {
                  const url = 'https://flutter.dev';
                  launchURL(url);
                },
                child: Container(
                    height: 40.0,
                    width: 40.0,
                    child: Icon(
                      Icons.privacy_tip,
                      color: titleColor,
                    )),
              )

              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(
              //         width: 1.0,
              //         color: purpleColor,
              //       ),
              //       shape: BoxShape.circle),
              //   height: size.width * .11,
              //   width: size.width * .11,
              // )
            ],
          ),
        ],
      ),
    );
  }
}
