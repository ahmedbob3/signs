import 'dart:io';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/reservation/models/insurance_card.dart';

class PatientInfoController extends BaseController{
  File patientUploadedCard;
  String patientId;
  bool haveInsurance = false;
  List<InsuranceCard> insuranceCards = [];
  bool showAddNewInsuranceCard = false;

  void updatePatientId({File patientUploadedCard, String patientId}){
    this.patientId = patientId;
    this.patientUploadedCard = patientUploadedCard;
    update();
  }

  void updatePatientInsuranceCards({File patientUploadedCard, String patientId}){
    insuranceCards.add(
      InsuranceCard(
        id: insuranceCards.length + 1,
        insuranceCardName: patientId,
        insuranceImage: patientUploadedCard,
        isSelected: true
      )
    );
    insuranceCards.forEach((element) {
      if(element.id != insuranceCards.length + 1){
        element.isSelected = false;
      }
    });
    showAddNewInsuranceCard = true;
    update();
  }

  void updateHaveInsurance(bool newValue){
    haveInsurance = newValue;
    update();
  }

  void handleAddNewCard() {
    showAddNewInsuranceCard = false;
    update();
  }
}