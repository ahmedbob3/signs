import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:Signs/Models/sign_up.dart';
import 'package:Signs/Repos/LoginRepos/signUp_repo.dart';

part 'signUp_event.dart';
part 'signUp_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  
  @override
  Stream<SignUpState> mapEventToState(
      SignUpEvent event,
  ) async* {
    if (event is doSignUpEvent) {
      yield SignUpLoadingState();
      var response =
          await SignUpRepo().signUp(
              event.mobileNumber,
              event.firstName,
              event.lastName,
              event.email,
              event.password,
              event.gender,
              event.birthDate,
              event.weight,
              event.height,
              event.bedTime,
              event.wakeupTime);
      yield SignUpLoadedState(response);
    }
    else if ( event is resetSignupState ){
      yield SignUpInitial();
    }

  }

  @override
  // TODO: implement initialState
  SignUpState get initialState => SignUpInitial();
}
