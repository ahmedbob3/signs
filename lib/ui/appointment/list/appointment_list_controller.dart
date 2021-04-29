import 'package:Signs/Models/subaccounts_model.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/appointment_repository.dart';
import 'package:Signs/data/remote/appointment/models/appointment_response_entity.dart';

class AppointmentListController extends BaseController{
  List<AppointmentResponseData> appointments = [];
  bool isLoading = false;
  final user = Singleton().loginModel.data;
  String displayedFirstName = '';
  String displayedLastName = '';

  AppointmentRepository _appointmentRepository = AppointmentRepository();

  AppointmentListController(){
    displayedFirstName = user.uFirstName;
    displayedLastName = user.uLastName;
    getAppointments(user.uId, user.uRelation.isEmpty? '0':'1');
  }

  void getAppointments(String userId, String userType) {
    isLoading = true;
    update();
    _appointmentRepository.getAppointments(userId, userType).then(
            (newAppointmentsResult){
              handleResponse(
                result: newAppointmentsResult,
                onSuccess: (){
                  if(newAppointmentsResult.data.data != null && newAppointmentsResult.data.data is List){
                    this.appointments = newAppointmentsResult.data.data;
                  } else{
                    this.appointments = [];
                  }
                  update();
                }
              );
              isLoading = false;
              update();
            }
    );
  }

  void updateDisplayedAccount(Data account, bool isMainAccount) {
    displayedFirstName = isMainAccount? user.uFirstName:account.saFirstName;
    displayedLastName = isMainAccount?user.uLastName:account.saLastName;
    getAppointments(isMainAccount? user.uId:account.saId, isMainAccount?'0':'0');
  }
}