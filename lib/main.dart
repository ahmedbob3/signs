import 'package:flutter/material.dart';
import 'package:signs/Screens/welcome_screen.dart';
import 'package:signs/Utils/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        fontFamily: 'Font-Regular',
        backgroundColor:  defaultBackgroundColor,
        canvasColor:  defaultBackgroundColor,
        primaryColor: defaultBackgroundColor,
        accentColor: defaultBackgroundColor,
        scaffoldBackgroundColor:  defaultBackgroundColor,
      ),
      home: WelcomeScreen(),
    );
  }
}