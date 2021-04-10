import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:dio/dio.dart';

class ConfirmReservationService extends BaseService{
  Future<Result> confirmReservation(
      {
        String userId,
        String userType,
        String scheduleId,
        String patientCardId,
        String haveInsurance,
        String medicalCardId
      }) async{
    final FormData data = FormData.fromMap(<String, dynamic>{
      'user_id':userId,
      'user_type':userType,
      'schedule_id':scheduleId,
      'patient_card_id':patientCardId,
      'having_insurance':haveInsurance,
      'medical_card_id':medicalCardId
    });
    var result = await NetworkUtil().post('${APIS.MAKE_APPOINTMENT}',
        body: data,isUpload: true
    );
    return result;
  }
}