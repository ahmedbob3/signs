import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/models/Appointment.dart';

class AppointmentListService extends BaseService{
  Future<List<Appointment>> getAppointments(){
    return Future.delayed(Duration(seconds: 2), (){
      return getMockAppointments();
    });
  }
}