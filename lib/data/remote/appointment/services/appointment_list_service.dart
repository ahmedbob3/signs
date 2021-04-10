import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/models/appointment_response_entity.dart';
import 'package:dio/dio.dart';

class AppointmentListService extends BaseService{
  Future<Result> getAppointments(String userId, String userType) async{
    final FormData data = FormData.fromMap(<String, dynamic>{
      'user_id':userId,
      'user_type':userType,
    });
    var result = await NetworkUtil().post("${APIS.APPOINTMENTS}&lang=$lang", body: data);
    if(result.status == Status.OK){
      try{
        result.data = AppointmentResponseEntity().fromJson(result.data);
      } catch(e){
        result.data = AppointmentResponseEntity();
      }
    }
    return result;
  }
}