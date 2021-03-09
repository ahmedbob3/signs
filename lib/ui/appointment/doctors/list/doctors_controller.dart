import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/doctors/doctors_repository.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctor.dart';

class DoctorsController extends BaseController{
  DoctorsRepository _doctorsRepository = DoctorsRepository();
  List<Doctor> availableDoctors = [];
  bool isDoctorsLoading = false;
  String selectedSpecialities = "All Specialities";

  DoctorsController(){
    getAvailableDoctors();
  }

  getAvailableDoctors(){
    isDoctorsLoading = true;
    update();
    _doctorsRepository.getAvailableDoctors().then(
            (doctors){
              availableDoctors = doctors;
              isDoctorsLoading = false;
              update();
            }
    );
  }
}