part of 'check_mobile_bloc.dart';

@immutable
abstract class CheckMobileState {}

class CheckMobileInitial extends CheckMobileState {}

class CheckMobileLoadingState extends CheckMobileState{}
class CheckMobileLoadedState extends CheckMobileState{
  CheckMobileModel response;
  CheckMobileLoadedState(this.response);
}