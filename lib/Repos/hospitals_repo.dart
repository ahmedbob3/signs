import 'dart:convert';

import 'package:signs/Exceptions/network_error.dart';
import 'package:signs/Exceptions/network_exception.dart';
import 'package:signs/Models/check_mobile.dart';
import 'package:signs/Models/hospitals_model.dart';
import 'package:signs/Models/login_model.dart';
import 'package:signs/Repos/base_repo.dart';
import 'package:signs/Utils/apis.dart';
import 'package:signs/Utils/constants.dart';
import 'package:http/http.dart' as http;

class HospitalsRepo extends BaseRepo {
  Future<HospitalsModel> getHospitalsList() async {
    var response = await http.get(
      Uri.encodeFull(APIS.serverURL + APIS.HOSPITALS_API),
    );
    var decodedResponse = json.decode(response.body);
    print('response .. ${response.body}');
    HospitalsModel modelResponse = HospitalsModel.fromMap(decodedResponse);
    return modelResponse;
  }
}
