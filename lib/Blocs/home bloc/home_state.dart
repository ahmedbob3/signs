part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final MedicationsModel medicationModel;
  final SubaccountsModel subaccountsModel;
  HomeLoadedState({this.medicationModel, this.subaccountsModel});
}

class HospitalsLoadedState extends HomeState {
  HospitalsModel hospitalsModel;
  HospitalsLoadedState(this.hospitalsModel);
}