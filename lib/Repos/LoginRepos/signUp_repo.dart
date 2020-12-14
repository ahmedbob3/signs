import 'dart:convert';

import 'package:Signs/Models/check_mobile.dart';
import 'package:Signs/Models/login_model.dart' as loginMod;
import 'package:Signs/Models/sign_up.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
      String wakeupTime) async {
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
    loginMod.Data data = loginMod.Data(
        uBedTime: modelResponse.data.uBedTime,
        uBirthDate: modelResponse.data.uBirthDate.toString(),
        uEmail: modelResponse.data.uEmail,
        uFirstName: modelResponse.data.uFirstName,
        uGender: modelResponse.data.uGender,
        uHeight: modelResponse.data.uHeight,
        uId: modelResponse.data.uId,
        uLastName: modelResponse.data.uLastName,
        uMobile: modelResponse.data.uMobile,
        uWakeUp: modelResponse.data.uWakeUp,
        uWeight: modelResponse.data.uWeight);

    loginMod.LoginModel loginModel = loginMod.LoginModel(data: data);

    Singleton().loginModel = loginModel;
    if (loginModel.code == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('mobileNumber', mobileNumber);
      prefs.setString('password', password);
    }
    return modelResponse;
  }
}
