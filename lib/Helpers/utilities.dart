import 'dart:convert';
import 'package:Signs/Constants/SharedPreferencesKeys.dart';
import 'package:Signs/Helpers/shared_prefrences.dart';
import 'package:Signs/Models/allow_recalculate_model.dart';
import 'package:Signs/Models/medication_time_notification_model.dart';


class Utilities {
  static  bool _isFirst = false;
  static  bool _switchEsharOn = false;




  static bool get isFirst => _isFirst;

  static set isFirst(bool value) {
    _isFirst = value;
  }




  // static List<Datum> getMainPrayerFromSharedPreference() {
  //   String medicationMainResponseStr = SharedPrefrenceHelper().getValueForKey(Strings.TimeNotification());
  //   if (medicationMainResponseStr == null) return null;
  //   return List<Datum>.fromJson(jsonDecode(timeNotificationMap));
  // }

  static int getMethodFromSharedPreference() {
    return 15; // specific for jordon


  }

  static MedicationTimeNotificationModel getNotificationSettingsFromSharedPrefs(String prefsKey) {
    String notificationSettingsStr =
        SharedPrefrenceHelper().getValueForKey(prefsKey);
    if (notificationSettingsStr == null) {
       SharedPrefrenceHelper().setValueForKey(prefsKey, jsonEncode(MedicationTimeNotificationModel().toJson()));
      return MedicationTimeNotificationModel.fromJson(jsonDecode(SharedPrefrenceHelper().getValueForKey(prefsKey)));
    } else
      return MedicationTimeNotificationModel.fromJson(
          jsonDecode(notificationSettingsStr));
  }

  static getAdhanSettingsFromSharedPrefs(String notificationKey) {
    MedicationTimeNotificationModel prayerTimeNotificationModel =
        Utilities.getNotificationSettingsFromSharedPrefs(notificationKey);
    return prayerTimeNotificationModel?.timeNotificationMap[notificationKey];
  }

  static MedicationTimesSettings getPrayerSettingsFromSharedPrefs() {
    String currentPrayerStr = SharedPrefrenceHelper()
        .getValueForKey(SharedPrefsKeys.MEDICATION_TIMES_SETTINGS);
    if (currentPrayerStr == null) {
      MedicationTimesSettings defaultPrayerSettings = MedicationTimesSettings();
      SharedPrefrenceHelper().setValueForKey(
          SharedPrefsKeys.MEDICATION_TIMES_SETTINGS,
          jsonEncode(defaultPrayerSettings.toJson()));
      return defaultPrayerSettings;
    }
    MedicationTimesSettings currentMedicationTimesSettings =
        MedicationTimesSettings.fromJson(jsonDecode(currentPrayerStr));
    return currentMedicationTimesSettings;
  }

  static MedicationTimesSettings getActiveManualDaylightFromSharedPrefs() {
    String currentActiveManualStr = SharedPrefrenceHelper()
        .getValueForKey(SharedPrefsKeys.ACTIVE_DAYLIGHT_MANULA);
    if (currentActiveManualStr == null) {
      MedicationTimesSettings defaultActiveManualSettings = MedicationTimesSettings();
      SharedPrefrenceHelper().setValueForKey(
          SharedPrefsKeys.ACTIVE_DAYLIGHT_MANULA,
          jsonEncode(defaultActiveManualSettings.toJson()));
      return defaultActiveManualSettings;
    }
    MedicationTimesSettings currentManualSettings =
        MedicationTimesSettings.fromJson(jsonDecode(currentActiveManualStr));
    return currentManualSettings;
  }

  static bool get switchEsharOn => _switchEsharOn;

  static set switchEsharOn(bool value) {
    _switchEsharOn = value;
  }
}
