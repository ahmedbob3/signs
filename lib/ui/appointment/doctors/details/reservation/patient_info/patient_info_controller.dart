import 'dart:io';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/reservation/models/insurance_card.dart';

class PatientInfoController extends BaseController{
  File patientUploadedCard;
  String patientId;
  bool haveInsurance = false;
  List<InsuranceCard> insuranceCards = [];
  bool showAddNewInsuranceCard = false;

  PatientInfoController(){
    print('inside PatientInfoController constructor');
  }
  void updatePatientId({File patientUploadedCard, String patientId}){
    this.patientId = patientId;
    this.patientUploadedCard = patientUploadedCard;
    update();
  }

  void updatePatientInsuranceCards({File patientUploadedCard, String patientId}){
    InsuranceCard card = InsuranceCard(
        id: insuranceCards.length + 1,
        insuranceCardName: patientId,
        insuranceImage: patientUploadedCard,
        isSelected: true
    );
    insuranceCards.add(card);
    insuranceCards.forEach((element) {
      if(element.id != card.id){
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

  void deleteInsuranceCard(InsuranceCard insuranceCard) {
    bool wasSelected = insuranceCard.isSelected;
    insuranceCards.remove(insuranceCard);
    if(wasSelected && insuranceCards.isNotEmpty){
      insuranceCards[0].isSelected = true;
    }
    update();
  }

  void selectInsuranceCard(InsuranceCard insuranceCard) {
    insuranceCards.forEach((card) {
      if(card.id == insuranceCard.id){
        card.isSelected = true;
      } else{
        card.isSelected = false;
      }
    });
    update();
  }

}