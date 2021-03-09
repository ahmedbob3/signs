import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/appointment/doctors/services/doctor_details_service.dart';
import 'package:Signs/data/remote/appointment/doctors/services/doctors_service.dart';

class DoctorsRepository{
  DoctorsService _doctorsService = DoctorsService();
  DoctorDetailsService _doctorDetailsService = DoctorDetailsService();

  Future<Result> getAvailableDoctors(String hospitalId){
    return _doctorsService.getAvailableDoctors(hospitalId);
  }

  Future<Result> getDoctorDetails(String doctorId){
    return _doctorDetailsService.getDoctorDetails(doctorId);
  }
}