import 'dart:convert';

import 'package:Signs/Models/medication_model.dart';
import 'package:Signs/Models/subAccount_model.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:http/http.dart' as http;
import '../base_repo.dart';

class SubAccountRepo extends BaseRepo {
  Future<SubAccountModel> subAccountInsert(
      String subAccountId,
  String subAccountFirstName,
  String subAccountLastName,
  String subAccountGender,
  String subAccountRelation
  ) async {
    Map<String, dynamic> params = {
      "first_name": subAccountFirstName,
    "last_name": subAccountLastName,
    "gender": subAccountGender,
    "u_id": subAccountId,
    "relation": subAccountRelation
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.SUB_ACCOUNT_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    SubAccountModel modelResponse = SubAccountModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
