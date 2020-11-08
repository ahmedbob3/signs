part of 'medication_bloc.dart';

@immutable
abstract class MedicationEvent {}


class doMedicationEvent extends MedicationEvent {
  int medicationNumber;
  String medicationName;
  String medicationFormId;
  String medicationDose;
  String medicationDuration;
  String medicationNote;
  String medicationTime;

  doMedicationEvent(
      this.medicationNumber,
      this.medicationName,
      this.medicationFormId,
      this.medicationDose,
      this.medicationDuration,
      this.medicationNote,
      this.medicationTime);
}

class resetSignupState extends MedicationEvent {}
