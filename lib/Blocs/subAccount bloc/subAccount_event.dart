part of 'subAccount_bloc.dart';

@immutable
abstract class subAccountEvent {}


class dosubAccountEvent extends subAccountEvent {
  int subAccountId;
  String subAccountFirstName;
  String subAccountLastName;
  String subAccountGender;
  String subAccountRelation;

  dosubAccountEvent(
      this.subAccountId,
      this.subAccountFirstName,
      this.subAccountLastName,
      this.subAccountGender,
      this.subAccountRelation);
}

class resetsubAccountState extends subAccountEvent {}
