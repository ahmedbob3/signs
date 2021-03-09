import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';

class DoctorsService extends BaseService{
  Future<Result> getAvailableDoctors(String hospitalId) async{
    var result = await NetworkUtil().get("get_doctors_by_hospital&lang=$lang&h_id=$hospitalId",);
    if (result.status == Status.OK) {
      result.data = DoctorsEntity().fromJson(result.data);
    }
    return result;
  }
}