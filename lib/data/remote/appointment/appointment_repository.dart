import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/appointment/services/appointment_list_service.dart';
import 'package:Signs/data/remote/appointment/services/rate_appointment_service.dart';

class AppointmentRepository{
  AppointmentListService _appointmentListService = AppointmentListService();
  RateAppointmentService _rateAppointmentService = RateAppointmentService();

  Future<Result> getAppointments(String userId, String userType){
    return _appointmentListService.getAppointments(userId, userType);
  }

  Future<Result> rateAppointment({
    String appointmentId,
    String doctorRate,
    String doctorFeedBack,
    String hospitalRate,
    String hospitalFeedBack
  }){
    return _rateAppointmentService.rateAppointment(appointmentId: appointmentId, doctorRate: doctorRate, doctorFeedBack: doctorFeedBack, hospitalRate: hospitalRate, hospitalFeedBack: hospitalFeedBack);
  }
}