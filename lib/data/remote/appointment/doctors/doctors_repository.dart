import 'package:Signs/data/remote/appointment/doctors/models/doctor.dart';
import 'package:Signs/data/remote/appointment/doctors/services/doctors_service.dart';

class DoctorsRepository{
  DoctorsService _doctorsService = DoctorsService();

  Future<List<Doctor>> getAvailableDoctors(){
    return _doctorsService.getAvailableDoctors();
  }
}