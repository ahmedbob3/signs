import 'dart:io';

import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/reservation/models/patient_cards_entity.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:flutter_uploader/flutter_uploader.dart';


class PatientIdService extends BaseService{
  final uploader = FlutterUploader();

  Future<Result> getPatientId(int userId, int userType) async{
    final FormData data = FormData.fromMap(<String, dynamic>{
      'user_id':userId,
      'user_type':userType,
    });
    var result = await NetworkUtil().post('${APIS.PATIENT_CARD}&lang=$lang',
        body: data,isUpload: true
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

  Future<Result> updateUserCardInfo({File uploadedFile, String userId, String userType, String patientId}) async{
    print('upload file: ${basename(uploadedFile.path)}');
    final FormData data = FormData.fromMap(<String, dynamic>{
      'patient_image': await MultipartFile.fromFile(
        uploadedFile.path,
        filename: basename(uploadedFile.path),
      ),
      'user_id':userId,
      'user_type':userType,
      'patient_id':patientId
    });
    var result = await NetworkUtil().post(APIS.SAVE_PATIENT_CARD, body: data, isUpload: true);

    return result;
  }
}