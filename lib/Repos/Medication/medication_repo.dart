import 'dart:convert';

import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:http/http.dart' as http;
import '../base_repo.dart';

class MedicationRepo extends BaseRepo {
  Future<MedicationModel> medicationInsert(
      String medicationNumber,
  String medicationName,
      String medicationFormId,
      String medicationDose,
  String medicationDuration,
  String medicationNote,
  String medicationTime

  ) async {
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
    MedicationModel modelResponse = MedicationModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
