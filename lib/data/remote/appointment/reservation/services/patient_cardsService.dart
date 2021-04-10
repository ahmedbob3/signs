import 'dart:io';

import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/reservation/models/patient_cards_entity.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class PatientCardsService extends BaseService{
  Future<Result> getPatientCards(int userId, int userType) async{
    final FormData data = FormData.fromMap(<String, dynamic>{
      'user_id':userId,
      'user_type':userType,
    });
    var result = await NetworkUtil().post('${APIS.PATIENT_MEDICAL_CARDS}&lang=$lang',
        body: data
    );
    if(result.status == Status.OK){
      try{
        result.data = PatientCardsEntity().fromJson(result.data);
      } catch(e){
        result.data = PatientCardsEntity();
      }
    }
    return result;
  }

  Future<Result> addNewMedicalCard({File uploadedFile, String userId, String userType, String medicalCardId}) async{
    print('upload file: ${basename(uploadedFile.path)}');
    final FormData data = FormData.fromMap(<String, dynamic>{
      'medical_card_image': await MultipartFile.fromFile(
        uploadedFile.path,
        filename: basename(uploadedFile.path),
      ),
      'user_id':userId,
      'user_type':userType,
      'medical_card_id':medicalCardId
    });
    var result = await NetworkUtil().post(APIS.ADD_NEW_MEDICAL_CARD, body: data, isUpload: true);

    return result;
  }
}