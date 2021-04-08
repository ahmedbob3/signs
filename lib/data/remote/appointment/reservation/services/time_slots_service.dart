import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/reservation/models/doctor_time_slots_entity.dart';
import 'package:Signs/Utils/apis.dart';

class TimeSlotsService extends BaseService{
  Future<Result> getTimeSlots(String doctorId) async{
    var result = await NetworkUtil().get('${APIS.DOCTOR_SCHEDULE}&lang=$lang&d_id=$doctorId&type=physical_appointment');
    if(result.status == Status.OK){
      try{
        result.data = DoctorTimeSlotsEntity().fromJson(result.data);
      } catch(e){
        result.data = DoctorTimeSlotsEntity();
      }
    }
    return result;
  }
}