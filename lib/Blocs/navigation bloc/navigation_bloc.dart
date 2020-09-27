import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signs/Screens/hospital_details_screen.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if ( event is openHomeScreen ) {
      yield HomeScreenState();
    } else if ( event is openHospitalScreen ) {
      yield HospitalDetailsScreenState();
    }
  }

  @override
  NavigationState get initialState => HomeScreenState();
}
