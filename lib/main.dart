import 'package:daily_pad/constans/routes/route.dart';
import 'package:daily_pad/constans/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //origentation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp(routes: AppRoutes()));
}

//start point
class MyApp extends StatelessWidget {
  //app route
  final AppRoutes routes;
  const MyApp({Key? key, required this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //baner
      debugShowCheckedModeBanner: false,
      //route
      onGenerateRoute: routes.genarateRoute,
      //theme
      theme: appTheme,
    );
  }
}
