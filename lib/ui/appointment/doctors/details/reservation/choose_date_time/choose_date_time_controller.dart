import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/models/doctor_time_slots_entity.dart';
import 'package:Signs/data/remote/appointment/reservation/reservation_repository.dart';
import 'package:intl/intl.dart';

class ChooseDateTimeController extends BaseController{
  DateTime selectedDate = DateTime.now();
  List<DoctorTimeSlot> availableTimeSlots = [];
  List<DoctorTimeSlot> allTimeSlots = [];
  bool isTimeSlotsLoading = false;
  ReservationRepository _reservationRepository = ReservationRepository();
  DoctorTimeSlot selectedTimeSlot;
  final Doctor doctor;
  final serverDateFormat = DateFormat('yyyy-MM-dd', 'en');

  ChooseDateTimeController(this.doctor){
   getTimeSlots();
  }

  selectNewDate(DateTime selectedDate){
    this.selectedDate = selectedDate;
    updateAvailableDates(selectedDate);
    update();
  }

  selectNewTimeSlot(DoctorTimeSlot selectedTimeSlot){
    this.selectedTimeSlot = selectedTimeSlot;
    update();
  }

  getTimeSlots(){
    isTimeSlotsLoading = true;
    update();
    _reservationRepository.getTimeSlots(doctor.id).then(
            (availableTimeSlotsResult){
              handleResponse(
                result: availableTimeSlotsResult,
                onSuccess: (){
                  if(availableTimeSlotsResult.data.data != null && availableTimeSlotsResult.data.data is List){
                    this.allTimeSlots = availableTimeSlotsResult.data.data;
                  } else{
                    this.allTimeSlots = [];
                  }
                  // get to day time slots
                  updateAvailableDates(DateTime.now());
                }
              );
              isTimeSlotsLoading = false;
              update();
            }
    );
  }

  bool checkIfNextButtonDisabled() {
    return !(selectedDate != null && selectedTimeSlot != null);
  }

  updateAvailableDates(DateTime date){
    availableTimeSlots = allTimeSlots.where((element) => element.dsDate == serverDateFormat.format(date)).toList();
    update();
  }
}