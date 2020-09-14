part of 'check_mobile_bloc.dart';

@immutable
abstract class CheckMobileEvent {}

class checkMobileNumberEvent extends CheckMobileEvent{
  String mobileNumber;

  checkMobileNumberEvent(this.mobileNumber);
}
