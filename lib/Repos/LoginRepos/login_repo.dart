import 'dart:convert';

import 'package:Signs/Exceptions/network_error.dart';
import 'package:Signs/Exceptions/network_exception.dart';
import 'package:Signs/Models/check_mobile.dart';
import 'package:Signs/Models/login_model.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:http/http.dart' as http;
import '../base_repo.dart';

class LoginRepo extends BaseRepo {
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

  Future<LoginModel> doLogin(String mobileNumber, String password) async {
    Map<String, dynamic> params = {"mobile": mobileNumber, "password" : password};
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.LOGIN_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    // if (response is SignsError) {
    //   throw NetworkException(decodedResponse.errorMessage);
    // }
    LoginModel modelResponse = LoginModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
