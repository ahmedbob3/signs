import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signs/Medication%20bloc/medication_bloc.dart';
import 'package:signs/Models/hospitals_model.dart';
import 'package:signs/Repos/LoginRepos/login_repo.dart';
import 'package:signs/Repos/hospitals_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is loadMedicationsEvent) {
      yield HomeLoadingState();
     // var response = await LoginRepo().doLogin('01063813377', '123456');
     //  var list = List<String>();
      var list = List<MedicationBloc>();
      //list.add("medication list ..");
      yield HomeLoadedState(list);
    } else if ( event is resetHomeEvent ){
      yield HomeInitial();
    } else if ( event is getHospitalsEvent ){
      yield HomeLoadingState();
      var response = await HospitalsRepo().getHospitalsList();
      if (response.code == 200){
        yield HospitalsLoadedState(response);
      }
    }
  }

  
  @override
  HomeState get initialState => HomeInitial();
}
