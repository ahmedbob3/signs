import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Screens/landing_screen.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/models/doctor_time_slots_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/models/insurance_card_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/models/patient_cards_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/reservation_repository.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/confirmation_success/confirmation_success_screen.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationBottomSheetController extends BaseController{
  PageController pageController = PageController();
  DateTime selectedDate;
  DoctorTimeSlot selectedTimeSlot;
  PatientCardsData patientId;
  InsuranceCardData selectedMedicalCard;
  AnimatedButtonController confirmAnimatedButtonController = AnimatedButtonController();
  ReservationRepository _reservationRepository = ReservationRepository();
  final user = Singleton().loginModel.data;

  goToNextPage(){
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void setSelectedDateAndTime(DateTime selectedDate, DoctorTimeSlot selectedTimeSlot) {
    this.selectedDate = selectedDate;
    this.selectedTimeSlot = selectedTimeSlot;
  }

  void savePatientCards({PatientCardsData patientId, InsuranceCardData selectedMedicalCard}) {
    this.patientId = patientId;
    this.selectedMedicalCard = selectedMedicalCard;
  }

  void confirmReservation(Doctor doctor, Datum hospital, String appointmentDate, String appointmentTime) async{
    confirmAnimatedButtonController.startAnimation();
    update();
    final result = await _reservationRepository.confirmReservation(
      userId: user.uId,
      userType: user.uRelation.isEmpty? '0':'1',
      patientCardId: patientId.piId,
      haveInsurance: selectedMedicalCard != null ? '1':'0',
      medicalCardId: selectedMedicalCard?.pmcId??"0",
      scheduleId: selectedTimeSlot.dsId
    );
    Get.offAndToNamed(ConfirmationSuccessScreen.tag, arguments: [doctor, hospital, appointmentDate, appointmentTime]);
  }
}