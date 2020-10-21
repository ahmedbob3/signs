part of 'signUp_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState{}
class SignUpLoadedState extends SignUpState{
  SigUpModel sigupresponse;
  SignUpLoadedState(this.sigupresponse);
}