import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';

class DoctorsService extends BaseService{
  Future<Result> getAvailableDoctors({String hospitalId, String doctorName, String searchKey}) async{
    var result = await NetworkUtil().get("get_doctors_by_hospital&lang=$lang&h_id=$hospitalId&search_key=$searchKey&doctor_name=$doctorName",);
    if (result.status == Status.OK) {
      try{
        result.data = DoctorsEntity().fromJson(result.data);
      } catch(e){
        result.data = DoctorsEntity();
      }
    }
    return result;
  }
}