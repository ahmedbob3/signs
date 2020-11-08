part of 'subAccount_bloc.dart';

@immutable
abstract class subAccountState {}

class subAccountInitial extends subAccountState {}

class subAccountLoadingState extends subAccountState{}
class subAccountLoadedState extends subAccountState{
  SubAccountModel subAccountresponse;
  subAccountLoadedState(this.subAccountresponse);
}