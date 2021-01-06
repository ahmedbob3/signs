part of 'medication_bloc.dart';

@immutable
abstract class MedicationEvent {}


class doMedicationEvent extends MedicationEvent {
  String medicationNumber;
  String medicationName;
  String medicationFormId;
  String medicationDose;
  String medicationDuration;
  String medicationNote;
  String medicationTime;
  String medicationCreateDate;

  doMedicationEvent(
      this.medicationNumber,
      this.medicationName,
      this.medicationFormId,
      this.medicationDose,
      this.medicationDuration,
      this.medicationNote,
      this.medicationTime,
      this.medicationCreateDate,
  );
}

class resetMedicationState extends MedicationEvent {}
class getMedicicationEvent extends MedicationEvent{}