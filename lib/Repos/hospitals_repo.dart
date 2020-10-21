import 'dart:convert';

import 'package:Signs/Exceptions/network_error.dart';
import 'package:Signs/Exceptions/network_exception.dart';
import 'package:Signs/Models/check_mobile.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Models/login_model.dart';
import 'package:Signs/Repos/base_repo.dart';
import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/constants.dart';
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
