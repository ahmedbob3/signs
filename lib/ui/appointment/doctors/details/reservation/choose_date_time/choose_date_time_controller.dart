import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/reservation/models/time_slot.dart';
import 'package:Signs/data/remote/appointment/reservation/reservation_repository.dart';

class ChooseDateTimeController extends BaseController{
  DateTime selectedDate = DateTime.now();
  List<TimeSlot> availableTimeSlots = [];
  bool isTimeSlotsLoading = false;
  ReservationRepository _reservationRepository = ReservationRepository();
  TimeSlot selectedTimeSlot;

  selectNewDate(DateTime selectedDate){
    this.selectedDate = selectedDate;
    getTimeSlots();
    update();
  }

  selectNewTimeSlot(TimeSlot selectedTimeSlot){
    this.selectedTimeSlot = selectedTimeSlot;
    update();
  }

  getTimeSlots(){
    isTimeSlotsLoading = true;
    update();
    _reservationRepository.getTimeSlots().then(
            (availableTimeSlots){
              isTimeSlotsLoading = false;
              this.availableTimeSlots = availableTimeSlots;
              update();
            }
    );
  }
}