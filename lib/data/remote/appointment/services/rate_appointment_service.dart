import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:dio/dio.dart';

class RateAppointmentService extends BaseService{
  Future<Result> rateAppointment({
    String appointmentId,
    String doctorRate,
    String doctorFeedBack,
    String hospitalRate,
    String hospitalFeedBack
  }) async{
    final FormData data = FormData.fromMap(<String, dynamic>{
      'a_id':appointmentId,
      'a_doctor_rate':doctorRate,
      'a_doctor_feedback':doctorFeedBack,
      'a_hospital_rate':hospitalRate,
      'a_hospital_feedback':hospitalFeedBack,
    });
    var result = await NetworkUtil().post("${APIS.RATE_APPOINTMENT}&lang=$lang", body: data);

    return result;
  }
}