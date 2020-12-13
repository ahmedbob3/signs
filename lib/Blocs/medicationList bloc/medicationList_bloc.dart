import 'dart:async';

import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Repos/Medication/medication_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'medicationList_event.dart';
part 'medicationList_state.dart';

class MedicationListBloc extends Bloc<MedicationListEvent, MedicationListState> {
  
  @override
  Stream<MedicationListState> mapEventToState(
      MedicationListEvent event,
  ) async* {
    if (event is doMedicationListEvent) {
      yield MedicationLoadingListState();
      var response =
          await MedicationRepo().medicationDelete(
              event.medicationNumber,
              event.medicationStatus
          );
      yield MedicationLoadedListState(response);
    }
    else if ( event is resetMedicationListState ){
      yield MedicationListInitial();
    }

  }

  @override
  // TODO: implement initialState
  MedicationListState get initialState => MedicationListInitial();
}
