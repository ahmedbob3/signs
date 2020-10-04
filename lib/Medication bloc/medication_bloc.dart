
import 'dart:ffi';

class MedicationBloc {
  String medicationNumber;
  String medicationImage;
  String medicationForm;
  Double medicationDose;
  String medicationTime;
  int medicationDuration;
  String medicationNotes;


  MedicationBloc(
      this.medicationNumber,
      this.medicationImage,
      this.medicationForm,
      this.medicationDose,
      this.medicationTime,
      this.medicationDuration,
      this.medicationNotes
      );
}
