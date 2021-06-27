import 'package:daily_pad/constans/text/text.dart';
import 'package:daily_pad/model/pad.dart';
import 'package:daily_pad/view/addEdit/addEdit.dart';
import 'package:daily_pad/view/home/home.dart';
import 'package:daily_pad/view/view/viewpad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route genarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case START_VIEW:
        return MaterialPageRoute(builder: (_) => HomeView());
      case ADD_VIEW:
      DailyPad dailyPad = settings.arguments as DailyPad;
        return MaterialPageRoute(builder: (_) => AddEditView(dailyPad: dailyPad,));
      case VIEW_PAD:
     DailyPad dailyPad = settings.arguments as DailyPad;
        return MaterialPageRoute(
            builder: (_) => ViewPad(
                  dailyPad: dailyPad,
                ));
      default:
        print('Not Route Available');
        return genarateRoute(settings);
    }
  }
}
