import 'dart:io';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/reservation/models/insurance_card.dart';
import 'package:Signs/data/remote/appointment/reservation/models/patient_cards_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/reservation_repository.dart';

class PatientInfoController extends BaseController{
  File patientUploadedCard;
  String patientId;
  bool haveInsurance = false;
  List<InsuranceCard> insuranceCards = [];
  bool showAddNewInsuranceCard = false;
  List<PatientCardsData> userMedicalCards = [];
  List<PatientCardsData> userIdCards = [];
  ReservationRepository _reservationRepository = ReservationRepository();
  final user = Singleton().loginModel.data;

  PatientInfoController(){
    getPatientId();
    getPatientCards();
  }
  void updatePatientId({File patientUploadedCard, String patientId}){
    this.patientId = patientId;
    this.patientUploadedCard = patientUploadedCard;
    _reservationRepository.updateUserCardInfo(
      uploadedFile: patientUploadedCard,
      patientId: patientId,
      userId: user.uId,
      userType: user.uRelation.isEmpty? '0':'1'
    );
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
    _reservationRepository.addNewMedicalCard(
      uploadedFile: patientUploadedCard,
      userId: user.uId,
      userType: user.uRelation.isEmpty? '0':'1',
      medicalCardId: patientId
    );
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

  void getPatientId() {
    _reservationRepository.getPatientId(int.parse(user.uId), user.uRelation.isEmpty? 0:1)
        .then((userIdResult){
          handleResponse(
            result: userIdResult,
            onSuccess: (){
              if(userIdResult.data.data != null && userIdResult.data.data is List){
                userIdCards = userIdResult.data.data;
                update();
              }
            }
          );
    });
  }

  void getPatientCards() {
    _reservationRepository.getPatientCards(int.parse(user.uId), user.uRelation.isEmpty? 0:1)
        .then((userPatientsCardsResult){
      handleResponse(
          result: userPatientsCardsResult,
          onSuccess: (){
            if(userPatientsCardsResult.data.data != null && userPatientsCardsResult.data.data is List){
              userMedicalCards = userPatientsCardsResult.data.data;
              update();
            }
          }
      );
    });
  }

}