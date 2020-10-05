part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  List<MedicationBloc> medicationList;
  HomeLoadedState(this.medicationList);
}

class HospitalsLoadedState extends HomeState {
  HospitalsModel hospitalsModel;
  HospitalsLoadedState(this.hospitalsModel);
}