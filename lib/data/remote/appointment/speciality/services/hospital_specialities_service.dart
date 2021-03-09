import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';

class HospitalSpecialitiesService extends BaseService{
  Future<Result> getHospitalSpecialities(
      {String hospitalId, String searchQuery}) async{
    var result = await NetworkUtil().get("get_specialities_by_hospital&lang=$lang&h_id=$hospitalId&search_key=$searchQuery",);
    if (result.status == Status.OK) {
    result.data = HospitalSpecialitiesEntity().fromJson(result.data);
    }
    return result;
  }
}