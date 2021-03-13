import 'package:Signs/base/base_service.dart';
import 'package:Signs/data/remote/appointment/reservation/models/time_slot.dart';

class TimeSlotsService extends BaseService{
  Future<List<TimeSlot>> getTimeSlots(){
    return Future.delayed(Duration(seconds: 1), (){
      return [
        TimeSlot(
          id: 1,
          name: '08:00 am',
          isAvailable: true
        ),
        TimeSlot(
            id: 2,
            name: '08:30 am',
            isAvailable: true
        ),
        TimeSlot(
            id: 3,
            name: '10:30 am',
            isAvailable: true
        ),
        TimeSlot(
            id: 4,
            name: '11:00 am',
            isAvailable: true
        ),
        TimeSlot(
            id: 5,
            name: '02:30 pm',
            isAvailable: false
        ),
        TimeSlot(
            id: 6,
            name: '04:30 am',
            isAvailable: true
        ),
        TimeSlot(
            id: 7,
            name: '05:00 am',
            isAvailable: false
        ),
        TimeSlot(
            id: 8,
            name: '06:00 am',
            isAvailable: true
        ),
        TimeSlot(
            id: 9,
            name: '07:30 am',
            isAvailable: true
        ),
      ];
    });
  }
}