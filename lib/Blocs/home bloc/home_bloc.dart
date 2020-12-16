import 'dart:async';

import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Models/subaccounts_model.dart';
import 'package:Signs/Notifications/NotificationPlugin.dart';
import 'package:Signs/Repos/Medication/medication_repo.dart';
import 'package:Signs/Repos/SubAccount/subAccount_repo.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:Signs/Models/hospitals_model.dart';
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
      setNotification();
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


  setNotification() async {
    for(int i=0;i<Constants.medicationList.length;i++){
      if(Constants.medicationList.elementAt(i).rememberTime.toString().length > 2){
        for (int j=0;j<Constants.medicationList.elementAt(i).rememberTime.length;j++){
          await notificationPlugin.showDailyAtTime(
              Constants.medicationList.elementAt(i).rememberTime.elementAt(j).toString().substring(1, Constants.medicationList.elementAt(i).rememberTime.toString().length - 1),
              Constants.medicationList.elementAt(i).mName.toString(),
              Constants.medicationList.elementAt(i).mDuration.toString(),
              Constants.medicationList.elementAt(i).mDose.toString(),
              Constants.medicationList.elementAt(i).mfName.toString()
          );
        }
      }
    // await notificationPlugin.showNotification();
     // await notificationPlugin.scheduleNotification();
    }
  }
  @override
  HomeState get initialState => HomeInitial();
}
