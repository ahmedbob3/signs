import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';
import 'package:Signs/data/remote/appointment/speciality/speciality_repository.dart';

class SpecialityController extends BaseController{
  List<HospitalSpecialitiesData> availableSpecialities = [];
  bool isLoading = false;
  SpecialityRepository _specialityRepository = SpecialityRepository();
  bool showNextButton = false;

  SpecialityController(){
    getSpecialities();
  }
  
  getSpecialities(){
    isLoading = true;
    update();
    _specialityRepository.getHospitalSpecialities(4).then(
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

  void selectSpeciality(HospitalSpecialitiesData specialitiesData) {
    specialitiesData.isSelected = !specialitiesData.isSelected;
    showNextButton = availableSpecialities.any((element) => element.isSelected);
    update();
  }
}