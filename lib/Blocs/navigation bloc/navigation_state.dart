part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class HomeScreenState extends NavigationState{}

class HospitalDetailsScreenState extends NavigationState{}