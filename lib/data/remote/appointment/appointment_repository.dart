import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/appointment/services/appointment_list_service.dart';

class AppointmentRepository{
  AppointmentListService _appointmentListService = AppointmentListService();

  Future<Result> getAppointments(String userId, String userType){
    return _appointmentListService.getAppointments(userId, userType);
  }
}