import 'dart:convert';

import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Models/subaccounts_model.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:http/http.dart' as http;
import '../base_repo.dart';

class SubAccountRepo extends BaseRepo {
  Future<SubaccountsModel> subAccountInsert(
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
    "u_id": Singleton().loginModel.data.uId,
    "relation": subAccountRelation
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.SUB_ACCOUNT_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    SubaccountsModel modelResponse = SubaccountsModel.fromMap(decodedResponse);
    return modelResponse;
  }



  Future<SubaccountsModel> getSubAccountsList() async {
    Map<String, dynamic> params = {
      "id": Singleton().loginModel.data.uId,
    };

    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.GET_SUBACCOUNTS_LIST),
      body: params,
    );

    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    SubaccountsModel modelResponse = SubaccountsModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
