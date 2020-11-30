import 'package:Signs/Utils/strings.dart';

class MedicationNotificationModel {
  Map<String, bool> medicationSettings = new Map();

  MedicationNotificationModel({this.medicationSettings}) {
    if (this.medicationSettings == null) this.medicationSettings = initMedicationMap();
  }

  Map<String, bool> initMedicationMap() {
    Map<String, bool> initialMedicationMap = new Map();
      initialMedicationMap["Medication"] = true;
    return initialMedicationMap;
  }

  MedicationNotificationModel.fromJson(Map<String, dynamic> json) {
    medicationSettings = new Map.from(json['Settings']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Settings'] = medicationSettings;
    return data;
  }
}
