import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Screens/landing_screen.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/ui/appointment/doctors/widgets/doctor_card.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConfirmationSuccessScreen extends StatelessWidget {
  static const tag = "ConfirmationSuccessScreen";
  @override
  Widget build(BuildContext context) {
    final Doctor doctor = Get.arguments[0];
    final Datum hospital = Get.arguments[1];
    String appointmentDate = Get.arguments[2];
    String appointmentTime = Get.arguments[3];
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50,),
          Image.asset(IC_SUCCESS_BOOKING, height: Get.height / 3,),
          SizedBox(height: 16,),
          Center(child: Text('Thank you for booking !', style: riffleGreenBoldStyle,)),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right: 16),
            child: DoctorCard(doctor:doctor, showHospitalInfo: true, hospital: hospital, appointmentDate: appointmentDate, appointmentTime: DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(appointmentTime)),),
          ),
          SizedBox(height: 36,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16),
                child: AnimatedButton(
                  btnName: "Appointments",
                  onPressed: (){
                    Get.offAll(LandingScreen(startIndex: 1,),);
                  },
                  controller: AnimatedButtonController(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
