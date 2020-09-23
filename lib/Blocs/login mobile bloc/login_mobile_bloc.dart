import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:signs/Models/check_mobile.dart';
import 'package:signs/Models/login_model.dart';
import 'package:signs/Repos/LoginRepos/login_repo.dart';

part 'login_mobile_event.dart';
part 'login_mobile_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is checkMobileNumberEvent) {
      yield LoginLoadingState();
      var response =
          await LoginRepo().checkMobileNumber(event.mobileNumber);

      yield LoginLoadedState(checkMobileResponse: response);
    } else if ( event is doLoginEvent ){
      yield LoginLoadingState();
      var response =
          await LoginRepo().doLogin(event.mobileNumber, event.password);
      
      yield LoginLoadedState(loginResponse: response);

    } else if ( event is resetState ){
      yield LoginInitial();
    }
  }

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial();
}
