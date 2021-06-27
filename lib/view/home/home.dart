import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/text/text.dart';
import 'package:daily_pad/constans/widget/dialog.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:daily_pad/constans/widget/toast.dart';
import 'package:daily_pad/model/pad.dart';
import 'package:daily_pad/service/db_helper.dart';
import 'package:daily_pad/view/home/utils/bottombar.dart';
import 'package:daily_pad/view/home/utils/call.dart';
import 'package:daily_pad/view/home/utils/item.dart';
import 'package:daily_pad/view/home/utils/title.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String currentArea = '';
  var currentTime = DateTime.now();
  var month;
  bool isFething = true;
  List<DailyPad> padList = [];
  late DBHelper dbHelper;
  String currentdate = '';

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    fetch();
    greetingMessage();
    currentArea = greetingMessage().toString();
    getmonth();
  }

  fetch() async {
    padList = await dbHelper.fetchList().whenComplete(() {
      setState(() {
        isFething = false;
        print("Congress Feched");
        print(padList.length);
      });
    });
  }

  getmonth() {
    var now = new DateTime.now();
    month = now.month;

    setState(() {
      currentdate =
          "${currentTime.day.toString()} ${months[month - 1].toString()} ${currentTime.year.toString()}";
    });
  }

  @override
  void dispose() {
    dbHelper.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DailyPad dailyPad = new DailyPad(
        id: 523,
        title: 'title',
        description: 'description',
        time: '20/30/2021',
        status: 'Running');
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: NestedScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                //title
                title: TitleUtil(),
                elevation: 0.0,
                pinned: true,
                floating: true,
                snap: true,
                //bottom bar
                bottom: bottomBar(
                    context,
                    currentTime.day.toString(),
                    months[month - 1].toString(),
                    currentTime.year.toString(),
                    currentArea,
                    size, () {
                  Navigator.pushNamed(context, ADD_VIEW, arguments: dailyPad)
                      .then((value) {
                    fetch();
                  });
                }),
              ),
            ];
          },
          body: isFething
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: padList.length == 0
                      ? Center(
                          child: sText(
                              "No Pad", orangeColor, 17.0, FontWeight.normal),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding:
                              EdgeInsets.only(top: 5.0, left: 14.0, right: 8.0),
                          itemCount: padList.length,
                          itemBuilder: (context, index) {
                            return Item(
                              dailyPad: padList[index],
                              onEdit: () {
                                if (padList[index].status != 'Complete') {
                                  Navigator.pushNamed(context, ADD_VIEW,
                                          arguments: padList[index])
                                      .whenComplete(() {
                                    fetch();
                                    Navigator.pop(context);
                                  });
                                } else {
                                  Navigator.pop(context);
                                  cDialog(context, 'Violation',
                                      'Sorry! You can only edit running status pad.This pad already completed');
                                }
                              },
                              onDelete: () {
                                Navigator.pop(context);
                                asdkDialog(context, 'Warning',
                                    'Do you want to delete this pad?', () {
                                  dbHelper
                                      .delete(padList[index].id as int)
                                      .whenComplete(() {
                                    fetch();
                                    Navigator.pop(context);
                                    cToast(
                                        'Congress!Pad Deleted ):', orangeColor);
                                  });
                                });
                              },
                              onChange: () {
                                String value =
                                    padList[index].status == 'Complete'
                                        ? 'Running'
                                        : 'Complete';
                                DailyPad dailyPad = DailyPad(
                                    id: padList[index].id,
                                    title: padList[index].title,
                                    description: padList[index].description,
                                    time: padList[index].time,
                                    status: value);
                                dbHelper.update(dailyPad).whenComplete(() {
                                  fetch();
                                  if (padList[index].status != 'Complete') {
                                    cToast('Congress! Pad Completed ):',
                                        successColor);
                                  } else {
                                    cToast('Hey! Pad Running ):', orangeColor);
                                  }
                                });
                              },
                            );
                          }),
                ),
        )));
  }
}
