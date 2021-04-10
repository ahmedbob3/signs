import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/appointment_repository.dart';
import 'package:Signs/data/remote/appointment/models/appointment_response_entity.dart';

class AppointmentListController extends BaseController{
  List<AppointmentResponseData> appointments = [];
  bool isLoading = false;
  final user = Singleton().loginModel.data;

  AppointmentRepository _appointmentRepository = AppointmentRepository();

  AppointmentListController(){
    getAppointments();
  }

  void getAppointments() {
    isLoading = true;
    update();
    _appointmentRepository.getAppointments(user.uId, user.uRelation.isEmpty? '0':'1').then(
            (newAppointmentsResult){
              handleResponse(
                result: newAppointmentsResult,
                onSuccess: (){
                  this.appointments = newAppointmentsResult.data.data;
                  update();
                }
              );
              isLoading = false;
              update();
            }
    );
  }
}