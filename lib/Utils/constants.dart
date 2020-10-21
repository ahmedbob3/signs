import 'package:Signs/Blocs/signUp%20bloc/signUp_bloc.dart';
import 'package:Signs/Models/signUp_data.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Screens/hospital_details_screen.dart';

enum languages { English, Arabic, Indian }

class Constants {
  static String appName = "Signs";
  static SignUpData signUpData = SignUpData();
  static List<bool> medications = [false, false, false,false, false, false,false, false, false,false, false];



  static languages languageId = languages.English;
  static TextDirection textDirection = Constants.languageId == languages.Arabic ? TextDirection.rtl : TextDirection.ltr;
  
  static updateTextDirection () {
    textDirection = Constants.languageId == languages.Arabic ? TextDirection.rtl : TextDirection.ltr;
  }

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Color(0xff212226);
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Colors.lightBlue;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Color(0xff313131);
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  TextStyle labelStyle({Color color, double fontSize}) {
    return TextStyle(color: color ?? Colors.black, fontSize: fontSize ?? 14);
  }

}
