import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signs/Screens/check_mobile_screen.dart';
import 'package:signs/Screens/landing_screen.dart';
import 'package:signs/Screens/langauage_screen.dart';
import 'package:signs/Screens/login_screen.dart';
import 'package:signs/Screens/welcome_screen.dart';
import 'package:signs/Utils/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: defaultBackgroundColor,
      ));

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Font-Regular',
          backgroundColor: defaultBackgroundColor,
          canvasColor: defaultBackgroundColor,
            //  theme: ThemeData(canvasColor: Colors.transparent)
          primaryColor: defaultBackgroundColor,
          scaffoldBackgroundColor: defaultBackgroundColor,
        ),
        home: LangauageScreen(),
        // home: CheckMobileScreen(),
      );
  }
}
