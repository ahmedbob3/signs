part of 'signUp_bloc.dart';

@immutable
abstract class SignUpCheckEvent {}

class SignUpEvent extends SignUpCheckEvent{
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

  SignUpEvent(
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
