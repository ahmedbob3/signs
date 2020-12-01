import 'dart:convert';
import 'dart:core';
import 'package:Signs/Constants/SharedPreferencesKeys.dart';
import 'package:Signs/Helpers/shared_prefrences.dart';
import 'package:Signs/Helpers/utilities.dart';
import 'package:Signs/Models/medication_time_notification_model.dart';
import 'package:Signs/Models/notification_model.dart';
import 'package:Signs/Models/on_off_notification_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:Signs/Models/response/medication_model.dart';




class NotificationsHelper {
  static final NotificationsHelper _instance = NotificationsHelper._internal();
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static const int _MAXIMUM_PENDING_NOTIFICATIONS = 60;
  List<Datum> _currentMonthPrayerModelResponse;
  int _notificationMedicationIndex = 1;


  NotificationsHelper._internal();

  factory NotificationsHelper() {
    if (_flutterLocalNotificationsPlugin == null) {
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
      var initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
      var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
      _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: _onSelectNotification);
    }
    return _instance;
  }

  Future<void> schedulePrayerNotifications(String notificationKey) async {
    if (notificationKey == Strings.TimeNotification()) {
      return;
    }
    reInitMedicationNotifications();
  }

  Future<void> _scheduleAgain(String notificationKey) async {
    bool removed =  await _removeOldNotifications(notificationKey);

    print("REMOVEDNOTIFI $removed");
    if (notificationKey == Strings.TimeNotification()) {
      return;
    }

    if (_currentMonthPrayerModelResponse != null) {
      MedicationNotificationModel prayerTimeNotificationModel = _getPrayerNotificationSettings();
      //  print("Clicked ${prayerTimeNotificationModel.toJson()}");
      MedicationTimeNotificationModel _medicationTimeNotificationModel = Utilities.getNotificationSettingsFromSharedPrefs(notificationKey);
      if (_medicationTimeNotificationModel != null) {
        NotificationSettings notificationSettings = _medicationTimeNotificationModel?.timeNotificationMap[notificationKey];

        for (Datum prayerDataObject
        in _currentMonthPrayerModelResponse) {
          await _configurePrayerNotifications(
              prayerDataObject,
              prayerTimeNotificationModel,
              notificationSettings,
              notificationKey);
        }
      }
    }
  }

  bool _isAtEndOfMonth() => DateTime.now().day >= 25;
  MedicationNotificationModel _medicationNotificationModel;

  //this method has no need for lite prayer as there is no setting or offset here in lite prayer
  Map<String, DateTime> FixSummerTime(Map<String, DateTime> medicationTimingMap) {
    var notificationsString = SharedPrefrenceHelper().getValueForKey(SharedPrefsKeys.NOTIFICATION_SETTINGS);

    if (notificationsString == null) {
      _medicationNotificationModel = new MedicationNotificationModel();
    } else {
      _medicationNotificationModel = MedicationNotificationModel.fromJson(jsonDecode(notificationsString));
    }

    if (_medicationNotificationModel.medicationSettings[Strings.TimeNotification()] ?? false) {
      String offsetFagr = SharedPrefrenceHelper()
          .getValueForKeyWithAlternativeValue(
          key: SharedPrefsKeys.MEDICATION_OFFSET, alternativeValue: "0")
          .toString();

      medicationTimingMap[Strings.TimeNotification()] = calculateMedicationTimeWithOffset(
          medicationTimingMap[Strings.TimeNotification()], offsetFagr);
    } else {
      medicationTimingMap.remove(Strings.TimeNotification());
    }

    return medicationTimingMap;
  }

  DateTime calculateMedicationTimeWithOffset(DateTime medicationDate, String offset) {
    medicationDate = medicationDate.add(new Duration(minutes: int.parse(offset)));

    if (Utilities.getPrayerSettingsFromSharedPrefs().isChangeToSummerTime && Utilities.getActiveManualDaylightFromSharedPrefs().activedaylightManual) {
      medicationDate = medicationDate.add(new Duration(hours: 1));
    }
    return medicationDate;
  }

  Future _configurePrayerNotifications(
      Datum medicationDataObject,
      MedicationNotificationModel prayerTimeNotificationModel,
      NotificationSettings notificationSettings,
      String notificationKey) async {
    Map<String, DateTime> medicationTimingsMap = new Map();
    DateFormat dateFormat = new DateFormat("dd MMM yyyy HH:mm");

    medicationTimingsMap[Strings.TimeNotification()] = dateFormat.parse(
            medicationDataObject.rememberTime.toString());
    ////////////////////////////////////////////////////////////////////////

    // String midNight =
    // SharedPrefrenceHelper().getValueForKey(SharedPrefsKeys.MID_NIGHT);
    // if (midNight != null && midNight != "" && Utilities.switchEsharOn) {
    //   prayerDataObject.timings.midnight = midNight;
    //   medicationTimingsMap[Strings.midNight()] = dateFormat.parse(
    //       prayerDataObject.prayerDate.readable +
    //           " " +
    //           prayerDataObject.timings.midnight);
    // }
////////////////////////////////////////////////////////////////////////

    for (String prayerName in medicationTimingsMap.keys) {
      DateTime prayerDate = medicationTimingsMap[prayerName];


      if (prayerDate.isAfter(DateTime.now())) {
        print(prayerDate);
        await _scheduleNotification(
            date: prayerDate,
            sound: (notificationSettings.isSilent != null &&
                notificationSettings.isSilent == true)
                ? null
                : notificationSettings.soundName,
            notificationKey: notificationKey,
            medicationName: prayerName,
            numOfMin: notificationSettings.numberOfMinutes);
//          }
      }
      // }
    }
  }

  MedicationNotificationModel _getPrayerNotificationSettings() {
    String notificationsString = SharedPrefrenceHelper().getValueForKey(SharedPrefsKeys.NOTIFICATION_SETTINGS);
    if (notificationsString == null) {
      return new MedicationNotificationModel();
    } else {
      return MedicationNotificationModel.fromJson(jsonDecode(notificationsString));
    }
  }

  Future _scheduleNotification(
      {DateTime date,
        String sound,
        String notificationKey,
        String medicationName,
        int numOfMin}) async {

    String channelId = "channelId_" + DateTime.now().microsecondsSinceEpoch.toString();
    String channelName = "channelId_" + DateTime.now().microsecondsSinceEpoch.toString();
    String channelDesc = "channelId_" + DateTime.now().microsecondsSinceEpoch.toString();

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName, channelDesc,
        playSound: true,
        sound: sound,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        largeIconBitmapSource: BitmapSource.Drawable,
        enableLights: true,
        enableVibration: false,
        ledOnMs: 1000,
        ledOffMs: 500);

    var iOSPlatformChannelSpecifics =
    IOSNotificationDetails(presentSound: true, sound: sound);

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    String notifBody = Strings.maoeed() + " " + medicationName;


    String title = "";
    DateFormat formater = DateFormat("h:mm aa","en");
    String firstTime = formater.format(date).split(" ").first;
    String secondTime = replaceAmPm(formater.format(date).toLowerCase().split(" ").last);
    String timeTitle = " ("+ firstTime+"" +secondTime+") ";
      title = medicationName+timeTitle;


    if (notificationKey == Strings.TimeNotification()) {
      notifBody = Strings.notifBody(numOfMin, medicationName);
    }

    if (_canScheduleMoreNotifications(notificationKey)) {
      int id = _notificationMedicationIndex += 1;

      id += 3000; //

      await _flutterLocalNotificationsPlugin.schedule(
          id, title, notifBody, date, platformChannelSpecifics);
      // print(
      //    "data which is transferred to the plugin are ${androidPlatformChannelSpecifics.playSound} ${androidPlatformChannelSpecifics.sound}  ${Strings.prayer() + prayerName} ,, ${notifBody} ,, ${date} ,, ${platformChannelSpecifics.android.toMap()}");
    }
  }

  bool _canScheduleMoreNotifications(String notificationKey) =>
      (notificationKey == Strings.TimeNotification() &&
              _notificationMedicationIndex < _MAXIMUM_PENDING_NOTIFICATIONS);

  Future<bool> _removeOldNotifications(String notificationKey) async {
    bool canceled = true;
    _notificationMedicationIndex = 1;
    var pendingNotificationRequests =
    await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    // print("total pending notifications: ${pendingNotificationRequests.length}");
    for (var pendingNotificationRequest in pendingNotificationRequests) {
      int notificationId = pendingNotificationRequest.id;
      if (notificationKey == Strings.TimeNotification() &&
          notificationId % 2 == 0) {
        //  print("before azan removed");
        //canceled =
        await _flutterLocalNotificationsPlugin.cancel(pendingNotificationRequest.id);

        return canceled;
      } else if (notificationKey == Strings.TimeNotification() &&
          notificationId % 2 == 1) {
        //  print("@ azan removed");
        //canceled =
        await _flutterLocalNotificationsPlugin.cancel(pendingNotificationRequest.id);

        return canceled;
      }
    }
    return canceled;
  }

  reInitMedicationNotifications() async {
    print("=======================reInitPrayerNotifications");

    _notificationMedicationIndex = 1;

    await _flutterLocalNotificationsPlugin.cancelAll();
    await _scheduleAgain(Strings.TimeNotification());
  }

  cancelAllNotifications() {
    _flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // print('received local notification');
  }

  static Future<void> _onSelectNotification(String payload) async {
    // print('selected notification');
  }




  String replaceAmPm(String prayT) {
    if (prayT == "am" && languages.English.toString() == "English" ?? false /* == true*/) {
      return prayT = " am";
    } else if (prayT == "am" && languages.English.toString() != "English" ?? false/*== false*/) {
      return prayT = " ص";
    } else if ((prayT == "pm" && languages.English.toString() == "English" ?? false/*== true*/)) {
      return prayT = " pm";
    } else if ((prayT == "pm" && languages.English.toString() != "English" ?? false /* == false*/)) {
      return prayT = " م";
    }
    return "";
  }

}
