import 'dart:convert';

import 'package:Signs/Models/check_mobile.dart';
import 'package:Signs/Models/sign_up.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:http/http.dart' as http;
import '../base_repo.dart';

class SignUpRepo extends BaseRepo {
  Future<SigUpModel> signUp(
  String mobileNumber,
  String firstName,
  String lastName,
  String email,
  String password,
  String gender,
  String birthDate,
  String weight,
  String height,
  String bedTime,
  String wakeupTime

  ) async {
    Map<String, dynamic> params = {
      "mobile": mobileNumber,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "gender": gender,
    "birth_date": birthDate,
    "weight": weight,
    "height": height,
    "bed_time": bedTime,
    "wake_up": wakeupTime
    };
    var response = await http.post(
      Uri.encodeFull(APIS.serverURL + APIS.SIGNUP_API),
      body: params,
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    SigUpModel modelResponse = SigUpModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
