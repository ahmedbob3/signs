import 'package:flutter/material.dart';

const Color DEFAULT_BACKGROUND_COLOR   = Color.fromRGBO(0, 81, 173, 1);
const Color DAVY_GREY_COLOR            = Color.fromRGBO(75, 76, 93, 1);
const Color ASH_GREY_COLOR             = Color.fromRGBO(183, 183, 187, 1);
const Color TAUPE_GREY_COLOR           = Color.fromRGBO(143, 145, 146, 1);
const Color Battleship_GREY_COLOR      = Color.fromRGBO(130, 130, 130, 1);
const Color COBALT_COLOR               = Color.fromRGBO(0, 67, 157, 1);
const Color LIGHT_WHITE_COLOR          = Color.fromRGBO(252, 254, 255, 1);
const Color MANATE                     = Color.fromRGBO(151, 151, 151, 0.24);
const Color MEDIUM_TEAL_BLUE           = Color.fromRGBO(0, 81, 173, 1);
const Color whiteSmoke                 = const Color(0xFFf5f5f5);
const Color dimGrey                    = const Color.fromRGBO(97, 97, 98, 1);
const Color gamboge                    = const Color.fromRGBO(223, 166, 12, 1);
const Color manate                     = const Color.fromRGBO(158, 158, 158, 1);
const Color heavyGrey                  = const Color.fromRGBO(101, 113, 127, 1);
const Color denium                     = const Color.fromRGBO(33, 99, 206, 1);

LinearGradient blueGradient = LinearGradient(
    colors: [MEDIUM_TEAL_BLUE, MEDIUM_TEAL_BLUE],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
);

LinearGradient disabledGradient = LinearGradient(
    colors: [ASH_GREY_COLOR, ASH_GREY_COLOR],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
);

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
    bodyText2: TextStyle(
      fontFamily: Fonts.regularFontFamily,
      fontSize: 14,
      color: dimGrey
    ),
    headline6: TextStyle(
      fontFamily: Fonts.boldFontFamily,
      fontSize: 18,
      color: COBALT_COLOR
    ),
    headline5: TextStyle(
      fontFamily: Fonts.regularFontFamily,
      fontSize: 14,
      color: manate
    ),
    button: TextStyle(
        fontFamily: Fonts.semiBoldFontFamily,
        fontSize: 16,
        color: Colors.white
    ),
  )
);

TextStyle hintTextStyle = TextStyle(
  fontFamily: Fonts.regularFontFamily,
  fontSize: 14,
  color: TAUPE_GREY_COLOR
);

TextStyle selectedItemTextStyle = TextStyle(
    fontFamily: Fonts.semiBoldFontFamily,
    fontSize: 14,
    color: Colors.white
);

TextStyle unselectedItemTextStyle = TextStyle(
    fontFamily: Fonts.semiBoldFontFamily,
    fontSize: 14,
    color: COBALT_COLOR
);

TextStyle boldBlackTextStyle = TextStyle(
    fontFamily: Fonts.boldFontFamily,
    fontSize: 18,
    color: Colors.black
);

TextStyle boldBlack14TextStyle = TextStyle(
    fontFamily: Fonts.boldFontFamily,
    fontSize: 14,
    color: Colors.black
);
TextStyle boldDeniumTextStyle = TextStyle(
    fontFamily: Fonts.boldFontFamily,
    fontSize: 20,
    color: denium
);

TextStyle gambogeRegularTextStyle = TextStyle(
    fontFamily: Fonts.regularFontFamily,
    fontSize: 14,
    color: gamboge
);

TextStyle heavyGreyRegularTextStyle = TextStyle(
    fontFamily: Fonts.regularFontFamily,
    fontSize: 14,
    color: heavyGrey
);

TextStyle dimGreySemiBoldTextStyle = TextStyle(
    fontFamily: Fonts.semiBoldFontFamily,
    fontSize: 12,
    color: dimGrey
);