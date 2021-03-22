import 'package:Signs/ui/appointment/list/appointment_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentListController>(
      init: AppointmentListController(),
      builder: (controller){
        return Container(color: Colors.amber,);
      },
    );
  }
}
