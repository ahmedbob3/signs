import 'dart:io';
import 'package:Signs/base/base_controller.dart';

class PatientInfoController extends BaseController{
  File patientUploadedCard;
  String patientId;

  void updatePatientId({File patientUploadedCard, String patientId}){
    this.patientId = patientId;
    this.patientUploadedCard = patientUploadedCard;
    update();
  }
}