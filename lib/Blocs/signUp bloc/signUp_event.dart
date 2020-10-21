part of 'signUp_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpCheckEvent extends SignUpEvent{
  String mobileNumber;
  String firstName;
  String lastName;
  String email;
  String password;
  String gender;
  String birthDate;
  String weight;
  String height;
  String bedTime;
  String wakeupTime;

  SignUpCheckEvent(
      this.mobileNumber,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.gender,
      this.birthDate,
      this.weight,
      this.height,
      this.bedTime,
      this.wakeupTime
      );
}

class doSignUpEvent extends SignUpEvent {
  String mobileNumber;
  String firstName;
  String lastName;
  String email;
  String password;
  String gender;
  String birthDate;
  String weight;
  String height;
  String bedTime;
  String wakeupTime;

  doSignUpEvent(
      this.mobileNumber,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.gender,
      this.birthDate,
      this.weight,
      this.height,
      this.bedTime,
      this.wakeupTime);
}

class resetSignupState extends SignUpEvent {}
