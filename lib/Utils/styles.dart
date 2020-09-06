import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const regularFontFamily = 'Font-Regular';
const lightFontFamily = 'Font-Light';
const mediumFontFamily = 'Font-Medium';
const boldFontFamily = 'Font-Bold';
const semiBoldFontFamily = 'Font-SemiBold';

const defaultBackgroundColor = Color.fromRGBO(0, 81, 173, 1);
const defaultSecondaryBackgroundColor = Color(0xFF3D5A80);
const defaultPrimaryBackgroundColor = Color(0xFFEE6C4D);
const TransparentColor = Color(0x00000000);


const defaultAppBarTheme = AppBarTheme(
    color: Colors.white,
    brightness: Brightness.light,
    textTheme: TextTheme(title: TextStyle(color: Colors.grey, fontSize: 20)));

const defaultTabBarTheme = TabBarTheme(
    labelColor: defaultBackgroundColor,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: ShapeDecoration(
      shape: ContinuousRectangleBorder(),
      color: Color.fromARGB(255, 253, 235, 226),
    ));

TextStyle titleStyle({Color color = Colors.white , double fontSize = 16, String fontFamily = 'Font-Regular'}) {
  return TextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize);
}
