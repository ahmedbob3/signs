import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/reservation/models/doctor_time_slots_entity.dart';
import 'package:flutter/material.dart';

class ReservationBottomSheetController extends BaseController{
  PageController pageController = PageController();
  DateTime selectedDate;
  DoctorTimeSlot selectedTimeSlot;

  goToNextPage(){
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void setSelectedDateAndTime(DateTime selectedDate, DoctorTimeSlot selectedTimeSlot) {
    this.selectedDate = selectedDate;
    this.selectedTimeSlot = selectedTimeSlot;
  }
}