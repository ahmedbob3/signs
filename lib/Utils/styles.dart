import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const defaultFontFamily = 'Helvetica';
const nunitoFontFamily = 'Nunito';
const notoSansFontFamily = 'NotoSANS';
const arabicFont = 'ArabicFont';

const defaultBackgroundColor = Color(0xFF212226);
const defaultSecondaryBackgroundColor = Color(0xFF3D5A80);
const defaultPrimaryBackgroundColor = Color(0xFFEE6C4D);

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
