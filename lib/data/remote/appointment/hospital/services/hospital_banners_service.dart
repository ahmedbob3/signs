import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/hospital/models/banners_response_entity.dart';

class HospitalBannersService extends BaseService{
  Future<Result> getHospitalBanners({String hospitalId,}) async{
    var result = await NetworkUtil().get("get_banners&lang=$lang&h_id=$hospitalId",);
    if (result.status == Status.OK) {
      try{
        result.data = BannersResponseEntity().fromJson(result.data);
      } catch(e){
        result.data = BannersResponseEntity();
      }
    }
    return result;
  }
}