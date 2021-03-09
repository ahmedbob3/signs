import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/doctors/doctors_repository.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';

class DoctorsController extends BaseController{
  DoctorsRepository _doctorsRepository = DoctorsRepository();
  List<Doctor> availableDoctors = [];
  bool isDoctorsLoading = false;
  String selectedSpecialities = "All Specialities";
  Datum hospital;

  DoctorsController({this.hospital}){
    getAvailableDoctors();
  }

  getAvailableDoctors(){
    isDoctorsLoading = true;
    update();
    _doctorsRepository.getAvailableDoctors(hospital.hId).then(
            (doctorsResult){
              handleResponse(
                result: doctorsResult,
                onSuccess: (){
                  availableDoctors = doctorsResult.data.data;
                }
              );
              isDoctorsLoading = false;
              update();
            }
    );
  }

  void filterBySpecialities(List<HospitalSpeciality> filteredSpecialities) {
    print("inside filter specialities");
  }

}