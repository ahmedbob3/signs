import 'dart:async';

import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Repos/Medication/medication_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'medication_event.dart';
part 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  
  @override
  Stream<MedicationState> mapEventToState(
      MedicationEvent event,
  ) async* {
    if (event is doMedicationEvent) {
      yield MedicationLoadingState();
      var response =
          await MedicationRepo().medicationInsert(
              event.medicationNumber,
              event.medicationName,
              event.medicationFormId,
              event.medicationDose,
              event.medicationDuration,
              event.medicationNote,
              event.medicationTime
          );
      yield MedicationLoadedState(response);
    }
    else if ( event is resetMedicationState ){
      yield MedicationInitial();
    }

  }

  @override
  // TODO: implement initialState
  MedicationState get initialState => MedicationInitial();
}
