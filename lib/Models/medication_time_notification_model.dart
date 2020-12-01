
import 'package:Signs/Models/notification_model.dart';
import 'package:Signs/Utils/strings.dart';

class MedicationTimeNotificationModel{
  Map<String,NotificationSettings> timeNotificationMap = new Map();
  MedicationTimeNotificationModel(){
    timeNotificationMap[Strings.TimeNotification()] = new NotificationSettings(groupID: 1);
  }

  MedicationTimeNotificationModel.fromJson(Map<String, dynamic> json) {
    timeNotificationMap = Map.from(json['timeNotificationMap'].map(
            (_, notificationsSettings) =>
            MapEntry(_, NotificationSettings.fromJson(notificationsSettings))));
  }

  Map<String, dynamic> toJson() {
    return {
      'timeNotificationMap': {
        Strings.TimeNotification():
        timeNotificationMap[Strings.TimeNotification()].toJson(),
      }
    };

  }
}