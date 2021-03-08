import 'package:Signs/data/remote/appointment/doctors/models/doctor.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctor_details.dart';
import 'package:Signs/data/remote/appointment/doctors/services/doctor_details_service.dart';
import 'package:Signs/data/remote/appointment/doctors/services/doctors_service.dart';

class DoctorsRepository{
  DoctorsService _doctorsService = DoctorsService();
  DoctorDetailsService _doctorDetailsService = DoctorDetailsService();

  Future<List<Doctor>> getAvailableDoctors(){
    return _doctorsService.getAvailableDoctors();
  }

  Future<DoctorDetails> getDoctorDetails(int doctorId){
    return _doctorDetailsService.getDoctorDetails(doctorId);
  }
}