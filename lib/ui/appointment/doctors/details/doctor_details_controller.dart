import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/doctors/doctors_repository.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctor_details_entity.dart';

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
            (detailsResult){
              handleResponse(
                result: detailsResult,
                onSuccess: (){
                  doctorDetails = detailsResult.data.data[0];
                }
              );
              isLoading = false;
              update();
            }
    );
  }
}