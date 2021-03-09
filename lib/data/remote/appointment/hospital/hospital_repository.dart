import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/appointment/hospital/services/hospital_banners_service.dart';

class HospitalRepository{
  HospitalBannersService _hospitalBannersService = HospitalBannersService();

  Future<Result> getHospitalBanners({String hospitalId,}){
    return _hospitalBannersService.getHospitalBanners(hospitalId: hospitalId);
  }
}