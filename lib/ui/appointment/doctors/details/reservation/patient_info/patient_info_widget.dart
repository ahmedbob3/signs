import 'dart:io';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/patient_info_controller.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/upload_card.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/patient_info/widgets/card_info.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
            ],
          ),
        );
      }
    );
  }
}
