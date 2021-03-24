import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/hospital/hospital_repository.dart';
import 'package:Signs/data/remote/appointment/hospital/models/banners_response_entity.dart';

class HospitalDetailsController extends BaseController{
  Datum hospital;
  int selectedTabIndex = SERVICES_TAP;
  HospitalDetailsController({this.hospital}){
    getHospitalBanners();
  }
  bool isBannerLoading = false;
  HospitalRepository _hospitalRepository = HospitalRepository();
  List<Banners> hospitalBanners = [];


  bool showTaps(){
    bool showTaps =  hospital.hasOnlineAppointment == 1 ||
    hospital.hasPhysicalAppointment == 1 ||
    hospital.hasMedicalHistory == 1 ||
    hospital.hasEmergencyCall == 1;
    print("show taps: $showTaps");
    return showTaps;
  }

  void selectNewIndex(int index) {
    selectedTabIndex = index;
    update();
  }

  void getHospitalBanners(){
    isBannerLoading = true;
    update();
    _hospitalRepository.getHospitalBanners(hospitalId: hospital.hId).then(
            (hospitalBannersResult){
              handleResponse(
                result: hospitalBannersResult,
                onSuccess: (){
                  hospitalBanners = hospitalBannersResult.data.data;
                },
              );
              isBannerLoading = false;
              update();
            }
    );
  }
}

const int SERVICES_TAP = 0;
const int OVERVIEW_TAP = 1;
