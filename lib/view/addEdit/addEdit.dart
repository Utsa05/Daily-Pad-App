import 'package:daily_pad/constans/color/color.dart';
import 'package:daily_pad/constans/text/text.dart';
import 'package:daily_pad/constans/widget/dialog.dart';
import 'package:daily_pad/constans/widget/text.dart';
import 'package:daily_pad/constans/widget/toast.dart';
import 'package:daily_pad/model/pad.dart';
import 'package:daily_pad/service/db_helper.dart';
import 'package:daily_pad/view/addEdit/utils/description.dart';
import 'package:daily_pad/view/addEdit/utils/title.dart';
import 'package:daily_pad/view/addEdit/utils/top.dart';
import 'package:flutter/material.dart';

class AddEditView extends StatefulWidget {
  final DailyPad dailyPad;
  const AddEditView({Key? key, required this.dailyPad}) : super(key: key);

  @override
  _AddEditViewState createState() => _AddEditViewState();
}

class _AddEditViewState extends State<AddEditView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _desController = TextEditingController();
  String currentArea = '';
  var currentTime = DateTime.now();
  var month;
  String currentdate = '';
  late DBHelper dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    getmonth();
    setData();
  }

  getmonth() {
    var now = new DateTime.now();
    month = now.month;

    setState(() {
      currentdate =
          "${currentTime.day.toString()} ${months[month - 1].toString()} ${currentTime.year.toString()}";

      print(currentdate);
    });
  }

  setData() {
    if (widget.dailyPad.id != 523) {
      //set value
      setState(() {
        _titleController.text = widget.dailyPad.title;
        _desController.text = widget.dailyPad.description;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isAdd = widget.dailyPad.id == 523;

    return Hero(
      tag: 'hero',
      child: Scaffold(
        backgroundColor: orangeColor,
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              //appbar
              TopSide(isAdd: isAdd),

              // view
              Expanded(
                  child: Container(
                      height: size.height,
                      width: size.width,
                      padding:
                          EdgeInsets.only(top: 18.0, left: 16.0, right: 16.0),
                      decoration: BoxDecoration(color: bgColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //title
                          TitleGet(controller: _titleController),
                          //Date
                          Container(
                            margin: EdgeInsets.only(top: 14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sText("DATE", blackColor.withOpacity(0.4), 13.0,
                                    FontWeight.w600),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    sText(currentdate, blackColor, 15.0,
                                        FontWeight.w500),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: titleColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: greylightColor,
                                )
                              ],
                            ),
                          ),

                          //description

                          DescriptionGet(controller: _desController)
                        ],
                      ))),

              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                    splashColor: orangeColor,
                    elevation: 0.0,
                    child: sText(isAdd ? "Create New Pad" : 'Edit The Pad',
                        whiteColor, 19.0, FontWeight.bold),
                    color: orangeColor,
                    onPressed: () {
                      if (isAdd) {
                        DailyPad dailyPad = new DailyPad(
                            title: _titleController.text,
                            description: _desController.text,
                            time: currentdate,
                            status: 'Running');

                        if (_titleController.text.isEmpty) {
                          cDialog(
                              context, 'Empty', 'Please Enter Your Pad Title');
                        } else if (_desController.text.isEmpty) {
                          cDialog(context, 'Empty',
                              'Please Enter Your Pad Description');
                        } else {
                          dbHelper.insert(dailyPad).whenComplete(() {
                            Navigator.pop(context);
                            cToast('Congress! Pad Created ):', successColor);
                          });
                        }
                      } else {
                        DailyPad dailyPad = new DailyPad(
                            id: widget.dailyPad.id,
                            title: _titleController.text,
                            description: _desController.text,
                            time: widget.dailyPad.time,
                            status: widget.dailyPad.status);

                        if (_titleController.text.isEmpty) {
                          cDialog(context, 'Empty', 'Enter Your Pad Title');
                        } else if (_desController.text.isEmpty) {
                          cDialog(
                              context, 'Empty', 'Enter Your Pad Description');
                        } else {
                          dbHelper.update(dailyPad).whenComplete(() {
                            Navigator.pop(context);
                            cToast('Congress! Pad Edited ):', successColor);
                          });
                        }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
