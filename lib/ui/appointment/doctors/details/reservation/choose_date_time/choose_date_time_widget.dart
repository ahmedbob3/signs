import 'package:Signs/Utils/calender/lib/calendar_strip.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/choose_date_time/widgets/time_slot.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/reservation_bottomsheet_controller.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/choose_date_time/choose_date_time_controller.dart';
import 'package:Signs/Utils/utils.dart';

class ChooseDateTimeWidget extends StatelessWidget {
  final Doctor doctor;

  const ChooseDateTimeWidget({Key key, this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseDateTimeController>(
      init: ChooseDateTimeController(doctor),
      builder: (controller){
        return Padding(
          padding: const EdgeInsets.only(left:16.0, right: 16),
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Center(child: Text('Book an appointment', style: boldSmaltTextStyle,)),
              SizedBox(height: 33,),
              Text('Appointment Type', style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        showComingSoonMessage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            border: Border.all(color: gansboro)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Online Appointment', style: unSelectedChipTextStyle,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4,),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: denium
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Physical Appointment', style: selectedChipTextStyle,),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 24,),
              Text('Appointment Date & Time', style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 24,),
              Text('Select Date', style: unSelectedChipTextStyle,),
              Container(
                height: 100,
                child: CalendarStrip(
                  startDate: DateTime.now(),
                  endDate: DateTime.now().add(Duration(days: 30)),
                  onDateSelected: (DateTime date){
                    controller.selectNewDate(date);
                  },
                  onWeekSelected: (date){},
                  selectedDate: controller.selectedDate,
                  addSwipeGesture: true,
                  dateTileBuilder: null,
                  iconColor: Colors.black87,
                  monthNameWidget: null,
                  containerDecoration: BoxDecoration(color: Colors.transparent),
                )
              ),
              Divider(height: 1, color: manate,),
              SizedBox(height: 24,),
              Text('Select Time Slot', style: unSelectedChipTextStyle,),
              SizedBox(height: 16,),
              controller.isTimeSlotsLoading?Container(
                height: 30,
                child: Center(child: CircularProgressIndicator())
              )
              :controller.availableTimeSlots.isEmpty?Container(height: 50,child: Center(child: Text('No Available Time slots')))
                  :Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 4,
                children: controller.availableTimeSlots.map((timeSlot) => TimeSlotChip(timeSlot: timeSlot,)).toList(),
              ),
              SizedBox(height: 16,),
              AnimatedButton(
                btnName: "Next",
                onPressed: (){
                  ReservationBottomSheetController bottomSheetController = Get.find();
                  bottomSheetController.setSelectedDateAndTime(controller.selectedDate, controller.selectedTimeSlot);
                  bottomSheetController.goToNextPage();
                },
                controller: AnimatedButtonController(),
                isDisabled: controller.checkIfNextButtonDisabled(),
              ),
              SizedBox(height: 16,)
            ],
          ),
        );
      },
    );
  }

}
