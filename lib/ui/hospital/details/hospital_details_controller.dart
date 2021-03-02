import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/base/base_controller.dart';

class HospitalDetailsController extends BaseController{
  Datum hospital;
  int selectedTabIndex = SERVICES_TAP;
  HospitalDetailsController({this.hospital});

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
}

const int OVERVIEW_TAP = 0;
const int SERVICES_TAP = 1;