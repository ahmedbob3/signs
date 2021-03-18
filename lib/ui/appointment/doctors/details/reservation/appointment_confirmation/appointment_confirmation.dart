import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/ui/appointment/doctors/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class AppointmentConfirmation extends StatelessWidget {
  final Doctor doctor;

  const AppointmentConfirmation({Key key, this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 24,),
        Text('Appointment Confirmation', style: boldSmaltTextStyle,),
        SizedBox(height: 24,),
        DoctorCard(doctor:doctor)
      ],
    );
  }
}
