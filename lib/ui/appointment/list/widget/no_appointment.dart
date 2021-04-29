import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoAppointmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Image.asset(NO_APPOINTMENT, height: Get.height/3,),
        SizedBox(height: 20,),
        Text("There’s no appointments Yet !", style: darkMidNightBoldStyle,),
        Expanded(child: Container())
      ],
    );
  }
}
