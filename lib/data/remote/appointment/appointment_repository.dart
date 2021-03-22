import 'package:Signs/data/remote/appointment/models/Appointment.dart';
import 'package:Signs/data/remote/appointment/services/appointment_list_service.dart';

class AppointmentRepository{
  AppointmentListService _appointmentListService = AppointmentListService();

  Future<List<Appointment>> getAppointments(){
    return _appointmentListService.getAppointments();
  }
}