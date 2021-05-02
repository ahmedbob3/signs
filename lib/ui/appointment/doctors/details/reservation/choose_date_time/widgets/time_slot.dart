import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/reservation/models/doctor_time_slots_entity.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/choose_date_time/choose_date_time_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeSlotChip extends StatelessWidget {
  final DoctorTimeSlot timeSlot;

  const TimeSlotChip({Key key, this.timeSlot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ChooseDateTimeController controller = Get.find();
    return ChoiceChip(
      label: Text(DateFormat('hh:mm a').format(DateFormat('hh:mm:ss', 'en').parse(timeSlot.dsTime))),
      selected: (controller.selectedTimeSlot?.dsId?? -1) == timeSlot.dsId,
      onSelected: (newValue){
        if(newValue && timeSlot.dsAvaliable == '1'){
          controller.selectNewTimeSlot(timeSlot);
        }
      },
      backgroundColor: timeSlot.dsAvaliable == '1' ? Colors.white:Colors.grey,
      selectedColor: denium,
      labelStyle: (controller.selectedTimeSlot?.dsId?? -1) == timeSlot.dsId ? selectedChipTextStyle:unselectedItemTextStyle,
    );
  }
}
