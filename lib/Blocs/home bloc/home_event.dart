part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class loadMedicationsEvent extends HomeEvent {}

class resetHomeEvent extends HomeEvent {}
