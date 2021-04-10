import 'dart:io';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/reservation/models/patient_cards_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/models/insurance_card_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/reservation_repository.dart';

class PatientInfoController extends BaseController{
  File patientUploadedCard;
  String patientId;
  List<PatientCardsData> userIdCards = [];
  bool isPatientIdLoading = false;

  bool haveInsurance = false;

  bool showAddNewInsuranceCard = false;
  List<InsuranceCardData> userMedicalCards = [];
  bool isAddNewMedicalCard = false;

  ReservationRepository _reservationRepository = ReservationRepository();
  final user = Singleton().loginModel.data;

  PatientInfoController(){
    print("current patient info controller: ${this.hashCode}");
    getPatientId();
    getPatientCards();
  }
  void updatePatientId({File patientUploadedCard, String patientId}) async{
    isPatientIdLoading = true;
    this.patientId = patientId;
    this.patientUploadedCard = patientUploadedCard;
    update();
    final addNewIdResult = await _reservationRepository.updateUserCardInfo(
      uploadedFile: patientUploadedCard,
      patientId: patientId,
      userId: user.uId,
      userType: user.uRelation.isEmpty? '0':'1'
    );
    handleResponse(
      result: addNewIdResult,
      onSuccess: (){
        getPatientId();
      }
    );
    update();
  }

  void updatePatientInsuranceCards({File patientUploadedCard, String patientId}) async{
    isAddNewMedicalCard = true;
    showAddNewInsuranceCard = true;
    update();
    final addNewMedicalResult = await _reservationRepository.addNewMedicalCard(
      uploadedFile: patientUploadedCard,
      userId: user.uId,
      userType: user.uRelation.isEmpty? '0':'1',
      medicalCardId: patientId
    );
    handleResponse(
      result: addNewMedicalResult,
      onSuccess: (){
        getPatientCards();
      }
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

  void deleteInsuranceCard(InsuranceCardData insuranceCard) {
    bool wasSelected = insuranceCard.isSelected;
    userMedicalCards.remove(insuranceCard);
    if(wasSelected && userMedicalCards.isNotEmpty){
      userMedicalCards[0].isSelected = true;
    }
    update();
  }

  void selectInsuranceCard(InsuranceCardData insuranceCard) {
    userMedicalCards.forEach((card) {
      if(card.pmcId == insuranceCard.pmcId){
        card.isSelected = true;
      } else{
        card.isSelected = false;
      }
    });
    update();
  }

  void getPatientId() {
    isPatientIdLoading = true;
    update();
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
          isPatientIdLoading = false;
          update();
    });
  }

  void getPatientCards() {
    isAddNewMedicalCard = true;
    update();
    _reservationRepository.getPatientCards(int.parse(user.uId), user.uRelation.isEmpty? 0:1)
        .then((userPatientsCardsResult){
      handleResponse(
          result: userPatientsCardsResult,
          onSuccess: (){
            if(userPatientsCardsResult.data.data != null && userPatientsCardsResult.data.data is List){
              userMedicalCards = userPatientsCardsResult.data.data;
            }
          }
      );
      isAddNewMedicalCard = false;
      update();
    });
  }

  void deleteCurrentId() {
    print("inside delete id");
    userIdCards = [];
    update();
  }

}