import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/reservation/models/time_slot.dart';
import 'package:flutter/material.dart';

class ReservationBottomSheetController extends BaseController{
  PageController pageController = PageController();
  DateTime selectedDate;
  TimeSlot selectedTimeSlot;

  goToNextPage(){
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void setSelectedDateAndTime(DateTime selectedDate, TimeSlot selectedTimeSlot) {
    this.selectedDate = selectedDate;
    this.selectedTimeSlot = selectedTimeSlot;
  }
}