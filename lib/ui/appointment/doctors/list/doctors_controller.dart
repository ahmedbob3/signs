import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/doctors/doctors_repository.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsController extends BaseController{
  DoctorsRepository _doctorsRepository = DoctorsRepository();
  List<Doctor> availableDoctors = [];
  bool isDoctorsLoading = false;
  String selectedSpecialities = "All Specialities";
  Datum hospital;
  var lastSearchQuery = "".obs;
  var specialityFilter = "";
  TextEditingController searchController = TextEditingController();

  DoctorsController({this.hospital}){
    getAvailableDoctors();
    handleSearchDoctors();
  }

  getAvailableDoctors(){
    isDoctorsLoading = true;
    update();
    _doctorsRepository.getAvailableDoctors(
      hospitalId: hospital.hId,
      doctorName: lastSearchQuery.value,
      searchKey: specialityFilter
    ).then(
            (doctorsResult){
              handleResponse(
                result: doctorsResult,
                onSuccess: (){
                  try{
                    availableDoctors = doctorsResult.data.data;
                  }catch(e){
                    availableDoctors = [];
                  }
                },
                onFailed: (){
                  availableDoctors = [];
                }
              );
              isDoctorsLoading = false;
              update();
            }
    );
  }

  void filterBySpecialities(List<HospitalSpeciality> filteredSpecialities) {
    specialityFilter = filteredSpecialities.map((e) => e.keywords).join(",");
    selectedSpecialities = filteredSpecialities.map((e) => e.name).join(", ");
    getAvailableDoctors();
  }

  void handleSearchDoctors() {
    searchController.addListener(() {
      lastSearchQuery.value = searchController.text;
    });
    debounce(lastSearchQuery, (_) => getAvailableDoctors(), time: Duration(seconds: 1));
  }

}