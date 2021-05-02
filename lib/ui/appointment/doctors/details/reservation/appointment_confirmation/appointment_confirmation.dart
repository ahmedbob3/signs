import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/date_formats.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/reservation_bottomsheet_controller.dart';
import 'package:Signs/ui/appointment/doctors/widgets/doctor_card.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentConfirmation extends StatelessWidget {
  final Doctor doctor;
  final Datum hospital;

  const AppointmentConfirmation({Key key, this.doctor, this.hospital}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ReservationBottomSheetController bottomSheetController = Get.find();
    String appointmentDate = AppDateFormats().dayMonthYearSpaced.format(bottomSheetController.selectedDate);
    String appointmentTime = bottomSheetController.selectedTimeSlot.dsTime;
    return Padding(
      padding: const EdgeInsets.only(left:16.0, right: 16),
      child: ListView(
        children: [
          SizedBox(height: 24,),
          Center(child: Text(S.of(context).appointmentConfirmation, style: boldSmaltTextStyle,)),
          SizedBox(height: 24,),
          DoctorCard(doctor:doctor, showHospitalInfo: true, hospital: hospital, appointmentDate: appointmentDate, appointmentTime: DateFormat('hh:mm a').format(DateFormat('hh:mm:ss', 'en').parse(appointmentTime)),),
          SizedBox(height: 24,),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    AnimatedButton(
                      btnName: S.of(context).confirm,
                      onPressed: (){
                        bottomSheetController.confirmReservation(doctor, hospital, appointmentDate, appointmentTime);
                      },
                      controller: bottomSheetController.confirmAnimatedButtonController,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Container(
                  height: 50,
                  child: TextButton(
                    child: Text(S.of(context).cancel),
                    onPressed: (){
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: lightGrey,
                      textStyle: semiGreyStyle,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
