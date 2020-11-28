import 'dart:async';

import 'package:Signs/Blocs/medication%20bloc/medication_bloc.dart';
import 'package:Signs/Models/medication_data.dart';
import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Models/subaccounts_model.dart';
import 'package:Signs/Repos/Medication/medication_repo.dart';
import 'package:Signs/Repos/SubAccount/subAccount_repo.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Repos/LoginRepos/login_repo.dart';
import 'package:Signs/Repos/hospitals_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is loadMedicationsEvent) {
      yield HomeLoadingState();
      var response = await MedicationRepo().getMedicicationsList();
      print('reesss ${response.data}');
      Constants.medicationList = response.data;

      yield HomeLoadedState(medicationModel: response);
    } else if (event is resetHomeEvent) {
      yield HomeInitial();
    } else if (event is getHospitalsEvent) {
      yield HomeLoadingState();
      var response = await HospitalsRepo().getHospitalsList();
      if (response.code == 200) {
        yield HospitalsLoadedState(response);
      }
    } else if (event is getSubaccountsEvent) {
      yield HomeLoadingState();
      var response = await SubAccountRepo().getSubAccountsList();
      print('reesss ${response.data}');
      Constants.subaccountsList= response.data;

      yield HomeLoadedState(subaccountsModel: response);
    }
  }

  @override
  HomeState get initialState => HomeInitial();
}
