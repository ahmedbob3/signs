import 'dart:convert';

import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:http/http.dart' as http;
import '../base_repo.dart';

class MedicationRepo extends BaseRepo {
  Future<MedicationsModel> medicationInsert(
      String medicationNumber,
      String medicationName,
      String medicationFormId,
      String medicationDose,
      String medicationDuration,
      String medicationNote,
      String medicationTime, String medicationCreateDate) async {
    Map<String, dynamic> params = {
      "u_id": medicationNumber,
      "m_name": medicationName,
      "mf_id": medicationFormId,
      "m_dose": medicationDose,
      "m_duration": medicationDuration,
      "m_reminder_note": medicationNote,
      "remember_time": medicationTime,
      "user_type": Constants.userType.toString(),
      "created_datetime":medicationCreateDate,
      'lang': Constants.languageId == languages.Arabic
          ? 'ar'
          : Constants.languageId == languages.English
              ? 'en'
              : 'ind'
    };

    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.MEDICATION_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    MedicationsModel modelResponse = MedicationsModel.fromMap(decodedResponse);
    return modelResponse;
  }

  Future<MedicationsModel> medicationEdit(
      String medicationNumber,
      String medicationName,
      String medicationFormId,
      String medicationDose,
      String medicationDuration,
      String medicationNote,
      String medicationTime,
      String medicationServerId) async {
    Map<String, dynamic> params = {
      "u_id": medicationNumber,
      "m_name": medicationName,
      "mf_id": medicationFormId,
      "m_dose": medicationDose,
      "m_duration": medicationDuration,
      "m_reminder_note": medicationNote,
      "remember_time": medicationTime,
      "m_id": medicationServerId
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.Edit_MEDICATION),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    MedicationsModel modelResponse = MedicationsModel.fromMap(decodedResponse);
    return modelResponse;
  }

  Future<MedicationsModel> medicationDelete(
      String medicationNumber, String medicationStatus) async {
    Map<String, dynamic> params = {
      "m_id": medicationNumber,
      "m_active": medicationStatus,
      "user_type": Constants.userType.toString(),
    };

    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.Edit_MEDICATION_STATUS),
      body: params,
    );

    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    MedicationsModel modelResponse = MedicationsModel.fromMap(decodedResponse);
    return modelResponse;
  }

  Future<MedicationsModel> getMedicicationsList() async {
    Map<String, dynamic> params = {
      "id": Singleton().loginModel.data.uId,
      "user_type": Constants.userType.toString(),
    };

    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.GET_MEDICATION_LIST),
      body: params,
    );

    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    MedicationsModel modelResponse = MedicationsModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
