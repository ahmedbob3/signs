import 'package:Signs/Utils/images.dart';
import 'package:flutter/material.dart';

class EmptySpecialities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IC_NO_SPECIALITIES, width: 250, height: 250,),
        SizedBox(height: 25,),
        Text("This Speciality not available right now")
      ],
    );
  }
}
