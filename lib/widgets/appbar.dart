import 'package:flutter/material.dart';

AppBar getAppBar({List<Widget> actions, String title = ""}){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(title),
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
  );
}