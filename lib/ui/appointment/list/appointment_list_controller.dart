import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/appointment_repository.dart';
import 'package:Signs/data/remote/appointment/models/Appointment.dart';

class AppointmentListController extends BaseController{
  List<Appointment> appointments = [];
  bool isLoading = false;
  AppointmentRepository _appointmentRepository = AppointmentRepository();

  AppointmentListController(){
    getAppointments();
  }

  void getAppointments() {
    isLoading = true;
    update();
    _appointmentRepository.getAppointments().then(
            (newAppointments){
              isLoading = false;
              this.appointments = newAppointments;
              update();
            }
    );
  }
}