import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctor_details_entity.dart';

class DoctorDetailsService extends BaseService{
  Future<Result> getDoctorDetails(String doctorId) async{
    var result = await NetworkUtil().get("get_doctor&lang=$lang&d_id=$doctorId",);
    if (result.status == Status.OK) {
      result.data = DoctorDetailsEntity().fromJson(result.data);
    }
    return result;
  }
}