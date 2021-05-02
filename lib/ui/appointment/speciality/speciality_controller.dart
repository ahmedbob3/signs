import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';
import 'package:Signs/data/remote/appointment/speciality/speciality_repository.dart';
import 'package:Signs/ui/appointment/doctors/list/doctors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialityController extends BaseController{
  List<HospitalSpeciality> availableSpecialities = [];
  bool isLoading = false;
  List<HospitalSpeciality> filteredSpecialities = [];
  SpecialityRepository _specialityRepository = SpecialityRepository();
  bool showNextButton = false;
  Datum hospital;
  TextEditingController searchController = TextEditingController();
  var lastSearchQuery = "".obs;
  HospitalSpeciality allSpecialitiesData = HospitalSpeciality(
      id: ALL_SPECIALITIES,
      name: allSpecialitiesMsg
  );

  bool checkIfAvailableSpecialitiesUpdated(){
    bool hasUpdated = false;
    List<HospitalSpeciality> selectedSpecialities = availableSpecialities.where((element) => element.isSelected).toList();
    if(selectedSpecialities.length == filteredSpecialities.length){
      for(int i = 0; i<selectedSpecialities.length; i++){
        if(selectedSpecialities[i].id != filteredSpecialities[i].id){
          hasUpdated = true;
        }
      }
    } else{
      hasUpdated = true;
    }
    return hasUpdated;
  }
  SpecialityController({this.hospital, this.filteredSpecialities}){
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
                  filteredSpecialities.forEach((filteredSpeciality) {
                    availableSpecialities.forEach((availableSpeciality) {
                      if(filteredSpeciality.id == availableSpeciality.id){
                        availableSpeciality.isSelected = true;
                      }
                    });
                  });
                  allSpecialitiesData.isSelected = !(availableSpecialities.any((element) => element.isSelected));
                  updateShowButtonState();
                  update();
                }
              );
            }
    );
  }

  void selectSpeciality(HospitalSpeciality specialitiesData) {
    specialitiesData.isSelected = !specialitiesData.isSelected;
    if(specialitiesData.id == ALL_SPECIALITIES){
      if(specialitiesData.isSelected){
        // if user select all specialities un select others
        availableSpecialities.forEach((element) {element.isSelected = false;});
      }
    } else{
      // if user select specific speciality un select all specialities
      if(specialitiesData.isSelected){
        allSpecialitiesData.isSelected = false;
      }
    }
    updateShowButtonState();
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

  void updateShowButtonState() {
    showNextButton = (availableSpecialities.any((element) => element.isSelected) || allSpecialitiesData.isSelected);
  }

}

const String ALL_SPECIALITIES = "-1";