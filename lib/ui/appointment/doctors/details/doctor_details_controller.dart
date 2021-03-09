import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/doctors/doctors_repository.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctor.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctor_details.dart';

class DoctorDetailsController extends BaseController{
  final Doctor doctor;
  DoctorDetails doctorDetails;
  bool isLoading = false;

  DoctorsRepository _doctorsRepository = DoctorsRepository();
  DoctorDetailsController(this.doctor){
    getDoctorDetails();
  }

  void getDoctorDetails() {
    isLoading = true;
    update();
    _doctorsRepository.getDoctorDetails(doctor.id).then(
            (details){
              isLoading = false;
              doctorDetails = details;
              update();
            }
    );
  }
}