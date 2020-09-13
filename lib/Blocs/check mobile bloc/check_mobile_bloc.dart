import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:signs/Models/check_mobile.dart';
import 'package:signs/Repos/CheckMobileRepos/check_mobile_repo.dart';

part 'check_mobile_event.dart';
part 'check_mobile_state.dart';

class CheckMobileBloc extends Bloc<CheckMobileEvent, CheckMobileState> {

  @override
  Stream<CheckMobileState> mapEventToState(
    CheckMobileEvent event,
  ) async* {
    if ( event is checkMobileNumberEvent ){
      yield CheckMobileLoadingState();
      var response = await CheckMobileRepo().checkMobileNumber(event.mobileNumber);
      yield CheckMobileLoadedState(response);
      // yield CheckMobileInitial();
    }
  }

  @override
  // TODO: implement initialState
  CheckMobileState get initialState => CheckMobileInitial();
}
