part of 'medicationList_bloc.dart';

@immutable
abstract class MedicationListState {}

class MedicationListInitial extends MedicationListState {}

class MedicationLoadingListState extends MedicationListState{}
class MedicationLoadedListState extends MedicationListState{
  MedicationsModel medicationListresponse;
  MedicationLoadedListState(this.medicationListresponse);
}