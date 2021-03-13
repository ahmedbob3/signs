import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/reservation/models/time_slot.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/choose_date_time/choose_date_time_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeSlotChip extends StatelessWidget {
  final TimeSlot timeSlot;

  const TimeSlotChip({Key key, this.timeSlot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ChooseDateTimeController controller = Get.find();
    return ChoiceChip(
      label: Text(timeSlot.name),
      selected: (controller.selectedTimeSlot?.id?? -1) == timeSlot.id,
      onSelected: (newValue){
        if(newValue){
          controller.selectNewTimeSlot(timeSlot);
        }
      },
      backgroundColor: Colors.white,
      selectedColor: denium,
      labelStyle: (controller.selectedTimeSlot?.id?? -1) == timeSlot.id ? selectedChipTextStyle:unselectedItemTextStyle,
    );
  }
}
