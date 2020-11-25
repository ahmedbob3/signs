import 'dart:convert';

import 'package:Signs/Blocs/medication%20bloc/medication_bloc.dart';
import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Utils/apis.dart';
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
      String medicationTime) async {
    Map<String, dynamic> params = {
      "u_id": medicationNumber,
      "m_name": medicationName,
      "mf_id": medicationFormId,
      "m_dose": medicationDose,
      "m_duration": medicationDuration,
      "m_reminder_note": medicationNote,
      "remember_time": medicationTime
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

  Future<MedicationsModel> getMedicicationsList() async {
    Map<String, dynamic> params = {
      "id": '1',
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
