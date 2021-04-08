import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/appointment/reservation/services/time_slots_service.dart';

class ReservationRepository{
  TimeSlotsService _timeSlotsService = TimeSlotsService();

  Future<Result> getTimeSlots(String doctorId){
    return _timeSlotsService.getTimeSlots(doctorId);
  }
}