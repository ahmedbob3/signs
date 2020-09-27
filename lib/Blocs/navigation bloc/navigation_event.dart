part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}


class openHomeScreen extends NavigationEvent{}

class openHospitalScreen extends NavigationEvent{}