import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signs/Screens/check_mobile_screen.dart';
import 'package:signs/Screens/landing_screen.dart';
import 'package:signs/Screens/langauage_screen.dart';
import 'package:signs/Screens/login_screen.dart';
import 'package:signs/Screens/splash_screen.dart';
import 'package:signs/Screens/welcome_screen.dart';
import 'package:signs/Utils/styles.dart';

import 'Utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CountryCodes.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
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
      home: SplashScreen()
    );
  }
}
