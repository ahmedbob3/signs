import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:signs/Models/sign_up.dart';
import 'package:signs/Repos/LoginRepos/signUp_repo.dart';

part 'signUp_event.dart';
part 'signUp_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  @override
  Stream<SignUpState> mapEventToState(
      SignUpEvent event,
  ) async* {
    if (event is SignUpEvent) {
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
  }

  @override
  // TODO: implement initialState
  SignUpState get initialState => SignUpInitial();
}
