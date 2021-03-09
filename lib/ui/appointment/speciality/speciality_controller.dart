import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';
import 'package:Signs/data/remote/appointment/speciality/speciality_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialityController extends BaseController{
  List<HospitalSpeciality> availableSpecialities = [];
  bool isLoading = false;
  SpecialityRepository _specialityRepository = SpecialityRepository();
  bool showNextButton = false;
  Datum hospital;
  TextEditingController searchController = TextEditingController();
  var lastSearchQuery = "".obs;

  SpecialityController({this.hospital}){
    getSpecialities();
    handleSearchSpecialities();
  }
  
  getSpecialities(){
    isLoading = true;
    update();
    _specialityRepository.getHospitalSpecialities(hospitalId: hospital.hId, searchQuery: lastSearchQuery.value).then(
            (specialitiesResult){
              handleResponse(
                result: specialitiesResult,
                onSuccess: (){
                  isLoading = false;
                  availableSpecialities = specialitiesResult.data.data;
                  update();
                }
              );
            }
    );
  }

  void selectSpeciality(HospitalSpeciality specialitiesData) {
    specialitiesData.isSelected = !specialitiesData.isSelected;
    showNextButton = availableSpecialities.any((element) => element.isSelected);
    update();
  }

  void filterBySpecialities() {
    List<HospitalSpeciality> selectedSpecialities = availableSpecialities.where((element) => element.isSelected).toList();
    Get.back(result: selectedSpecialities);
  }

  void handleSearchSpecialities() {
    searchController.addListener(() {
      lastSearchQuery.value = searchController.text;
    });
    debounce(lastSearchQuery, (_) => getSpecialities(), time: Duration(seconds: 1));
  }
}