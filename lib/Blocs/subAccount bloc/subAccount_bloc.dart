import 'dart:async';


import 'package:Signs/Models/subAccount_model.dart';
import 'package:Signs/Repos/SubAccount/subAccount_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'subAccount_event.dart';
part 'subAccount_state.dart';

class subAccountBloc extends Bloc<subAccountEvent, subAccountState> {
  
  @override
  Stream<subAccountState> mapEventToState(
      subAccountEvent event,
  ) async* {
    if (event is dosubAccountEvent) {
      yield subAccountLoadingState();
      var response =
          await SubAccountRepo().subAccountInsert(
              event.subAccountId,
              event.subAccountFirstName,
              event.subAccountLastName,
              event.subAccountGender,
              event.subAccountRelation
          );
      yield subAccountLoadedState(response);
    }
    else if ( event is resetsubAccountState ){
      yield subAccountInitial();
    }

  }

  @override
  // TODO: implement initialState
  subAccountState get initialState => subAccountInitial();
}
