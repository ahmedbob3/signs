part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final MedicationsModel medicationModel;
  HomeLoadedState({this.medicationModel});
}

class HospitalsLoadedState extends HomeState {
  HospitalsModel hospitalsModel;
  HospitalsLoadedState(this.hospitalsModel);
}