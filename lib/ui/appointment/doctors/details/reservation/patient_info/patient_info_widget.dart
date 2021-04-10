import 'dart:io';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/patient_info_controller.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/upload_card.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/card_info.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/have_insurance_card.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/reservation_bottomsheet_controller.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientInfoController>(
      builder: (controller){
        String subAccountName = Singleton().loginModel.data.uFirstName;
        String subAccountRelation = Singleton().loginModel.data.uRelation;
        return Padding(
          padding: const EdgeInsets.only(left:16.0, right: 16),
          child: ListView(
            children: [
              SizedBox(height: 73,),
              Text('Patient info', style: boldSmaltTextStyle,),
              SizedBox(height: 20,),
              Text('You Have appointment for $subAccountRelation', style: unSelectedChipTextStyle,),
              SizedBox(height: 16,),
              Text(subAccountName, style: boldHeavyBlueTextStyle,),
              SizedBox(height: 20,),
              Text('Patient ID', style: heavyGreySemiBoldTextStyle,),
              SizedBox(height: 10,),
              if(controller.isPatientIdLoading)
                Center(child: CircularProgressIndicator(),),
              if(!controller.isPatientIdLoading && controller.patientUploadedCard == null && controller.userIdCards.isEmpty)
                UploadCard(
                  hint: 'Enter ID',
                  onCardAdded: (File uploadedCardImage, String cardId){
                    controller.updatePatientId(patientId: cardId, patientUploadedCard: uploadedCardImage);
                  }
                ),
              if(!controller.isPatientIdLoading && controller.patientUploadedCard != null ||  controller.userIdCards.isNotEmpty)
                CardInfo(
                  cardId: controller.patientId,
                  cardData: controller.userIdCards.isNotEmpty?controller.userIdCards.last:null,
                  onSelected: (){

                  },
                  onDeleted: (){
                    controller.deleteCurrentId();
                  },
                  isSelected: true,
                ),
              SizedBox(height: 10,),
              HaveInsuranceCard(
                isSelected: controller.haveInsurance,
                onChanged: controller.updateHaveInsurance,
              ),
              if(controller.haveInsurance && (!controller.showAddNewInsuranceCard || controller.userMedicalCards.isEmpty))
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: UploadCard(
                    hint: 'Enter Medical card',
                    onCardAdded: (File uploadedCardImage, String cardId){
                      controller.updatePatientInsuranceCards(patientId: cardId, patientUploadedCard: uploadedCardImage);
                    },
                  ),
                ),
              SizedBox(height: 8,),
              ...controller.userMedicalCards.map(
                      (insuranceCard) => CardInfo(
                        cardId: insuranceCard.pmcId,

                        selectedCardImage: insuranceCard.pmcCardImage,
                        isSelected: insuranceCard.isSelected,
                        onSelected: (){
                          controller.selectInsuranceCard(insuranceCard);
                        },
                        onDeleted: (){
                          controller.deleteInsuranceCard(insuranceCard);
                        },
                      )
              ).toList(),
              if(controller.userMedicalCards.isNotEmpty) Divider(
                color: silverDivider,
                height: 2,
              ),
              if(controller.showAddNewInsuranceCard && controller.userMedicalCards.isNotEmpty) ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: denium
                  ),
                  child: Icon(Icons.add, color: Colors.white,),
                ),
                title: Text('Add New Card', style: regularDeniumTextStyle,),
                onTap: (){
                  controller.handleAddNewCard();
                },
              ),
              SizedBox(height: 24,),
              AnimatedButton(
                btnName: "Next",
                onPressed: (){
                  ReservationBottomSheetController bottomSheetController = Get.find();
                  bottomSheetController.goToNextPage();
                },
                controller: AnimatedButtonController(),
              )
            ],
          ),
        );
      }
    );
  }
}
