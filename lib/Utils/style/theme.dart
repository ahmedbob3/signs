
import 'package:flutter/material.dart';
const Color DEFAULT_BACKGROUND_COLOR = Color.fromRGBO(0, 81, 173, 1);
const Color DAVY_GREY_COLOR = Color.fromRGBO(75, 76, 93, 1);
const Color ASH_GREY_COLOR = Color.fromRGBO(183, 183, 187, 1);
const Color TAUPE_GREY_COLOR = Color.fromRGBO(143, 145, 146, 1);
const Color Battleship_GREY_COLOR = Color.fromRGBO(130, 130, 130, 1);
const Color COBALT_COLOR = Color.fromRGBO(0, 67, 157, 1);
const Color LIGHT_WHITE_COLOR = Color.fromRGBO(252, 254, 255, 1);
const Color MANATE = Color.fromRGBO(151, 151, 151, 0.24);

class Fonts{
  static String regularFontFamily   = 'Font-Regular';
  static String lightFontFamily     = 'Font-Light';
  static String mediumFontFamily    = 'Font-Medium';
  static String boldFontFamily      = 'Font-Bold';
  static String semiBoldFontFamily  = 'Font-SemiBold';
  static String heavyBoldFontFamily = 'Font-HeavyBold';
}
final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  fontFamily: Fonts.regularFontFamily,
  primaryColor: DEFAULT_BACKGROUND_COLOR,
  textTheme: TextTheme(
    subtitle1: TextStyle(
      fontFamily: Fonts.semiBoldFontFamily,
      fontSize: 16,
      color: DAVY_GREY_COLOR
    ),
    bodyText1: TextStyle(
      fontFamily: Fonts.regularFontFamily,
      fontSize: 14,
      color: ASH_GREY_COLOR
    ),
    headline6: TextStyle(
      fontFamily: Fonts.boldFontFamily,
      fontSize: 18,
      color: COBALT_COLOR
    ),
  )
);
TextStyle hintTextStyle = TextStyle(
  fontFamily: Fonts.regularFontFamily,
  fontSize: 14,
  color: TAUPE_GREY_COLOR
);