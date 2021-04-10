import 'dart:io';

import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/appointment/reservation/services/patientIdService.dart';
import 'package:Signs/data/remote/appointment/reservation/services/patient_cardsService.dart';
import 'package:Signs/data/remote/appointment/reservation/services/time_slots_service.dart';
import 'package:Signs/data/remote/appointment/reservation/services/confirm_reservation_service.dart';

class ReservationRepository{
  TimeSlotsService _timeSlotsService = TimeSlotsService();
  PatientIdService _patientIdService = PatientIdService();
  PatientCardsService _patientCardsService = PatientCardsService();
  ConfirmReservationService _confirmReservationService = ConfirmReservationService();

  Future<Result> getTimeSlots(String doctorId){
    return _timeSlotsService.getTimeSlots(doctorId);
  }

  Future<Result> getPatientId(int userId, int userType) {
    return _patientIdService.getPatientId(userId, userType);
  }

  Future<Result> getPatientCards(int userId, int userType) {
    return _patientCardsService.getPatientCards(userId, userType);
  }

  Future<Result> updateUserCardInfo({File uploadedFile, String userId, String userType, String patientId}){
    return _patientIdService.updateUserCardInfo(
      uploadedFile: uploadedFile,
      userId: userId,
      userType: userType,
      patientId: patientId
    );
  }

  Future<Result> addNewMedicalCard({File uploadedFile, String userId, String userType, String medicalCardId}){
    return _patientCardsService.addNewMedicalCard(
        uploadedFile: uploadedFile,
        userId: userId,
        userType: userType,
        medicalCardId: medicalCardId
    );
  }

  Future<Result> confirmReservation(
      {
        String userId,
        String userType,
        String scheduleId,
        String patientCardId,
        String haveInsurance,
        String medicalCardId
      }){
    return _confirmReservationService.confirmReservation(
      userId: userId,
      userType: userType,
      scheduleId: scheduleId,
      medicalCardId: medicalCardId,
      haveInsurance: haveInsurance,
      patientCardId: patientCardId
    );
  }
}