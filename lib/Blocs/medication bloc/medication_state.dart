part of 'medication_bloc.dart';

@immutable
abstract class MedicationState {}

class MedicationInitial extends MedicationState {}

class MedicationLoadingState extends MedicationState{}
class MedicationLoadedState extends MedicationState{
  MedicationsModel medicationresponse;
  MedicationLoadedState(this.medicationresponse);
}