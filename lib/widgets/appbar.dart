import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar getAppBar({List<Widget> actions, String title = "", Function onBackPressed}){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(title),
    actions: actions,
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed:(){
        if(onBackPressed != null){
          onBackPressed();
        } else{
          Get.back();
        }
      },
    ),
  );
}