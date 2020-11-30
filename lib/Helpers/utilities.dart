import 'dart:convert';
import 'dart:io';
import 'package:Signs/Constants/SharedPreferencesKeys.dart';
import 'package:Signs/Helpers/shared_prefrences.dart';
import 'package:Signs/Models/medication_time_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';


class Utilities {
  static  bool _isFirst = false;
  static  bool _switchFajrOn = false;
  static  bool _switchEsharOn = false;
  static  double _width ;


  static bool get switchFajrOn => _switchFajrOn;

  static set switchFajrOn(bool value) {
    _switchFajrOn = value;
  }

  static double get width => _width;

  static set width(double value) {
    _width = value;
  }

  static bool get isFirst => _isFirst;

  static set isFirst(bool value) {
    _isFirst = value;
  }

  static bool isTablet(BuildContext context ,{bool checkAndroid = false}) {
   var shortestSide = MediaQuery.of(context).size.shortestSide;
   if(checkAndroid){
     return Device.get().isTablet &&  Platform.isAndroid  &&  shortestSide > 600  ? true : false;

   }
   return Device.get().isTablet && shortestSide > 600  ? true : false;

  }


  static String getSchoolFromSharedPreference() {
    PrayerModelResponse prayerMainResponse =
        getMainPrayerFromSharedPreference();
    if (prayerMainResponse == null || prayerMainResponse.prayerDataObject.first.prayerMetaData.school == null)
      return "STANDARD";
    return prayerMainResponse.prayerDataObject.first.prayerMetaData.school;
  }

  static PrayerModelResponse getMainPrayerFromSharedPreference() {
    String prayerMainResponseStr = SharedPrefrenceHelper().getValueForKey(SharedPrefsKeys.PRAYER_MAIN_RESPONSE);
    if (prayerMainResponseStr == null) return null;
    return PrayerModelResponse.fromJson(jsonDecode(prayerMainResponseStr));
  }

  static int getMethodFromSharedPreference() {
    return 15; // specific for jordon

    // for git

/*    int initialMethod =
        SharedPrefrenceHelper().getValueForKey(SharedPrefsKeys.METHOD_NAME);
    if (initialMethod != null) {
      return initialMethod;
    }
    PrayerModelResponse prayerMainResponse =
        getMainPrayerFromSharedPreference();
    final defaultPrayerMethod = 4;
    if (prayerMainResponse == null ||
        prayerMainResponse.prayerDataObject.first.prayerMetaData.method.id ==
            null) return defaultPrayerMethod;
    return prayerMainResponse.prayerDataObject.first.prayerMetaData.method.id;*/
  }

  static MedicationTimeNotificationModel getNotificationSettingsFromSharedPrefs(
      String prefsKey) {
    String notificationSettingsStr =
        SharedPrefrenceHelper().getValueForKey(prefsKey);
    if (notificationSettingsStr == null) {
       SharedPrefrenceHelper().setValueForKey(
          prefsKey, jsonEncode(MedicationTimeNotificationModel().toJson()));
      return MedicationTimeNotificationModel.fromJson(jsonDecode(SharedPrefrenceHelper().getValueForKey(
          prefsKey)));
    } else
      return MedicationTimeNotificationModel.fromJson(
          jsonDecode(notificationSettingsStr));
  }

  static getAdhanSettingsFromSharedPrefs(String notificationKey) {
    MedicationTimeNotificationModel prayerTimeNotificationModel =
        Utilities.getNotificationSettingsFromSharedPrefs(notificationKey);
    return prayerTimeNotificationModel?.timeNotificationMap[notificationKey];
  }

/*  static CalendarSettingsModel getCalendarSettingsFromSharedPrefs() {
    String calendarSettingsStr = SharedPrefrenceHelper()
        .getValueForKey(SharedPrefsKeys.CALENDAR_SETTINGS);
    if (calendarSettingsStr == null) {
      CalendarSettingsModel defaultCalendarSettings = CalendarSettingsModel();
      SharedPrefrenceHelper().setValueForKey(SharedPrefsKeys.CALENDAR_SETTINGS,
          jsonEncode(defaultCalendarSettings.toJson()));
      return defaultCalendarSettings;
    }
    return CalendarSettingsModel.fromJson(jsonDecode(calendarSettingsStr));
  }*/

  static PrayerTimesSettings getPrayerSettingsFromSharedPrefs() {
    String currentPrayerStr = SharedPrefrenceHelper()
        .getValueForKey(SharedPrefsKeys.PRAYER_TIMES_SETTINGS);
    if (currentPrayerStr == null) {
      PrayerTimesSettings defaultPrayerSettings = PrayerTimesSettings();
      SharedPrefrenceHelper().setValueForKey(
          SharedPrefsKeys.PRAYER_TIMES_SETTINGS,
          jsonEncode(defaultPrayerSettings.toJson()));
      return defaultPrayerSettings;
    }
    PrayerTimesSettings currentPrayerTimesSettings =
        PrayerTimesSettings.fromJson(jsonDecode(currentPrayerStr));
    return currentPrayerTimesSettings;
  }

  static PrayerTimesSettings getActiveManualDaylightFromSharedPrefs() {
    String currentActiveManualStr = SharedPrefrenceHelper()
        .getValueForKey(SharedPrefsKeys.ACTIVE_DAYLIGHT_MANULA);
    if (currentActiveManualStr == null) {
      PrayerTimesSettings defaultActiveManualSettings = PrayerTimesSettings();
      SharedPrefrenceHelper().setValueForKey(
          SharedPrefsKeys.ACTIVE_DAYLIGHT_MANULA,
          jsonEncode(defaultActiveManualSettings.toJson()));
      return defaultActiveManualSettings;
    }
    PrayerTimesSettings currentManualSettings =
        PrayerTimesSettings.fromJson(jsonDecode(currentActiveManualStr));
    return currentManualSettings;
  }

  static LocationModel getCordinateFromSharedPreference() {
    LocationModel cordinateMainResponse =
        getMainCordinateFromSharedPreference();
    LocationModel staticvalues =
        LocationModel(latitude: 30.0444, longitude: 31.2357);
    if (cordinateMainResponse == null) return staticvalues;
    return cordinateMainResponse;
  }

  static LocationModel getMainCordinateFromSharedPreference() {
    String cordinateResponseStr =
        SharedPrefrenceHelper().getValueForKey(SharedPrefsKeys.USER_LOCATION);
    if (cordinateResponseStr == null) return null;
    return LocationModel.fromJson(jsonDecode(cordinateResponseStr));
  }

  static bool get switchEsharOn => _switchEsharOn;

  static set switchEsharOn(bool value) {
    _switchEsharOn = value;
  }
}
