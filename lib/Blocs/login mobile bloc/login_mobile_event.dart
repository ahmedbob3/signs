part of 'login_mobile_bloc.dart';

@immutable
abstract class LoginEvent {}

class checkMobileNumberEvent extends LoginEvent{
  String mobileNumber;
  checkMobileNumberEvent(this.mobileNumber);
}

class doLoginEvent extends LoginEvent {
  String mobileNumber;
  String password;
  doLoginEvent(this.mobileNumber, this.password);
}
