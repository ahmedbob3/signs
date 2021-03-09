import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/appointment/speciality/services/hospital_specialities_service.dart';

class SpecialityRepository{
  HospitalSpecialitiesService _hospitalSpecialitiesService = HospitalSpecialitiesService();

  Future<Result> getHospitalSpecialities({String hospitalId, String searchQuery}){
    return _hospitalSpecialitiesService.getHospitalSpecialities(hospitalId:hospitalId, searchQuery: searchQuery);
  }

}