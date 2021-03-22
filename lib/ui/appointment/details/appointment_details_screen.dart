import 'package:Signs/ui/appointment/details/appointment_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentDetailsController>(
      init: AppointmentDetailsController(),
      builder: (controller){
        return Container(color: Colors.black,)
      }
    );
  }
}
