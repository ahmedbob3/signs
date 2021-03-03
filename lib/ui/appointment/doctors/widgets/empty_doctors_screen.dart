import 'package:Signs/Utils/images.dart';
import 'package:flutter/material.dart';

class EmptyDoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IC_NO_DOCTORS, width: 250, height: 250,),
        SizedBox(height: 25,),
        Text("There’s No Doctors Found")
      ],
    );
  }
}
