part of 'medicationList_bloc.dart';

@immutable
abstract class MedicationListEvent {}


class doMedicationListEvent extends MedicationListEvent {
  String medicationNumber;
  String medicationStatus;
  doMedicationListEvent(
      this.medicationNumber,
      this.medicationStatus);
}

class resetMedicationListState extends MedicationListEvent {}
class getMedicationListEvent extends MedicationListEvent{}