import 'dart:convert';

import 'package:signs/Exceptions/network_error.dart';
import 'package:signs/Exceptions/network_exception.dart';
import 'package:signs/Models/check_mobile.dart';
import 'package:signs/Utils/apis.dart';
import 'package:signs/Utils/constants.dart';
import 'package:http/http.dart' as http;
import '../base_repo.dart';

class CheckMobileRepo extends BaseRepo {
  Future<CheckMobileModel> checkMobileNumber(String mobileNumber) async {
    Map<String, dynamic> params = {"mobile": mobileNumber};
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.CHECK_MOBILE_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    // if (response is SignsError) {
    //   throw NetworkException(decodedResponse.errorMessage);
    // }
    CheckMobileModel modelResponse = CheckMobileModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
