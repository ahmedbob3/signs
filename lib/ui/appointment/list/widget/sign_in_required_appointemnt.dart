import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInRequiredAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Image.asset(NO_APPOINTMENT, height: Get.height/3,),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(S.of(context).signUpToViewAppointment, style: darkMidNightBoldStyle, textAlign: TextAlign.center,),
        ),
        Expanded(child: Container())
      ],
    );
  }
}
