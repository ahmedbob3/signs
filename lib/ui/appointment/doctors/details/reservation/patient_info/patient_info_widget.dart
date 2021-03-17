import 'dart:io';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/patient_info_controller.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/upload_card.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/card_info.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/have_insurance_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientInfoController>(
      init: PatientInfoController(),
      builder: (controller){
        return Padding(
          padding: const EdgeInsets.only(left:16.0, right: 16),
          child: ListView(
            children: [
              SizedBox(height: 73,),
              Text('Patient info', style: boldSmaltTextStyle,),
              SizedBox(height: 20,),
              Text('You Have appointment for your Daughter', style: unSelectedChipTextStyle,),
              SizedBox(height: 16,),
              Text('Henrietta', style: boldHeavyBlueTextStyle,),
              SizedBox(height: 20,),
              Text('Patient ID', style: heavyGreySemiBoldTextStyle,),
              SizedBox(height: 10,),
              if(controller.patientUploadedCard == null)
                UploadCard(
                  hint: 'Enter ID',
                  onCardAdded: (File uploadedCardImage, String cardId){
                    controller.updatePatientId(patientId: cardId, patientUploadedCard: uploadedCardImage);
                  },
                ),
              if(controller.patientUploadedCard != null)
                CardInfo(
                  cardId: controller.patientId,
                  selectedCardImage: controller.patientUploadedCard,
                  onSelected: (){

                  },
                  onDeleted: (){

                  },
                  isSelected: true,
                ),
              SizedBox(height: 10,),
              HaveInsuranceCard(
                isSelected: controller.haveInsurance,
                onChanged: controller.updateHaveInsurance,
              ),
              if(controller.haveInsurance && !controller.showAddNewInsuranceCard)
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: UploadCard(
                    hint: 'Enter Medical card',
                    onCardAdded: (File uploadedCardImage, String cardId){
                      controller.updatePatientInsuranceCards(patientId: cardId, patientUploadedCard: uploadedCardImage);
                    },
                  ),
                ),
              ...controller.insuranceCards.map(
                      (insuranceCard) => CardInfo(
                        cardId: insuranceCard.insuranceCardName,
                        selectedCardImage: insuranceCard.insuranceImage,
                        isSelected: insuranceCard.isSelected,
                        onSelected: (){},
                        onDeleted: (){},
                      )
              ).toList(),
              if(controller.showAddNewInsuranceCard && controller.insuranceCards.isNotEmpty) ListTile(
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
            ],
          ),
        );
      }
    );
  }
}
