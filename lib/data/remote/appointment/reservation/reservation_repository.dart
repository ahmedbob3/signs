import 'package:Signs/data/remote/appointment/reservation/models/time_slot.dart';
import 'package:Signs/data/remote/appointment/reservation/services/time_slots_service.dart';

class ReservationRepository{
  TimeSlotsService _timeSlotsService = TimeSlotsService();

  Future<List<TimeSlot>> getTimeSlots(){
    return _timeSlotsService.getTimeSlots();
  }
}