part of 'login_mobile_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState{}
class LoginLoadedState extends LoginState{
  CheckMobileModel checkMobileResponse;
  LoginModel loginResponse;
  LoginLoadedState({this.checkMobileResponse, this.loginResponse});
}