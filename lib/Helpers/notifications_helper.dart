import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:Signs/Constants/SharedPreferencesKeys.dart';
import 'package:Signs/Helpers/shared_prefrences.dart';
import 'package:Signs/Helpers/utilities.dart';
import 'package:Signs/Models/medication_time_notification_model.dart';
import 'package:Signs/Models/notification_model.dart';
import 'package:Signs/Models/on_off_notification_model.dart';
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
    reInitPrayerNotifications();
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
  MedicationNotificationModel _prayerNotificationModel;

  //this method has no need for lite prayer as there is no setting or offset here in lite prayer
  Map<String, DateTime> FixSummerTime(Map<String, DateTime> prayerTimingMap) {
    var notificationsString = SharedPrefrenceHelper()
        .getValueForKey(SharedPrefsKeys.NOTIFICATION_SETTINGS);

    if (notificationsString == null) {
      _prayerNotificationModel = new MedicationNotificationModel();
    } else {
      _prayerNotificationModel =
          MedicationNotificationModel.fromJson(jsonDecode(notificationsString));
    }

    if (_prayerNotificationModel.prayerSettings[Strings.salahMwaeed()[0]] ??
        false) {
      String offsetFagr = SharedPrefrenceHelper()
          .getValueForKeyWithAlternativeValue(
          key: SharedPrefsKeys.FAJR_OFFSET, alternativeValue: "0")
          .toString();

      prayerTimingMap[Strings.fagr()] = calculatePrayerTimeWithOffset(
          prayerTimingMap[Strings.fagr()], offsetFagr);
    } else {
      prayerTimingMap.remove(Strings.fagr());
    }

    if (_prayerNotificationModel.prayerSettings[Strings.salahMwaeed()[1]]) {
      String offsetDohr = SharedPrefrenceHelper()
          .getValueForKeyWithAlternativeValue(
          key: SharedPrefsKeys.DUHR_OFFSET, alternativeValue: "0")
          .toString();

      prayerTimingMap[Strings.duhr()] = calculatePrayerTimeWithOffset(
          prayerTimingMap[Strings.duhr()], offsetDohr);
    } else {
      prayerTimingMap.remove(Strings.duhr());
    }

    if (_prayerNotificationModel.prayerSettings[Strings.salahMwaeed()[2]]) {
      String offsetAsr = SharedPrefrenceHelper()
          .getValueForKeyWithAlternativeValue(
          key: SharedPrefsKeys.ASR_OFFSET, alternativeValue: "0")
          .toString();

      prayerTimingMap[Strings.asr()] = calculatePrayerTimeWithOffset(
          prayerTimingMap[Strings.asr()], offsetAsr);
    } else {
      prayerTimingMap.remove(Strings.asr());
    }

    if (_prayerNotificationModel.prayerSettings[Strings.salahMwaeed()[3]]) {
      String offsetMaghrib = SharedPrefrenceHelper()
          .getValueForKeyWithAlternativeValue(
          key: SharedPrefsKeys.MAGHRIB_OFFSET, alternativeValue: "0")
          .toString();

      prayerTimingMap[Strings.maghreb()] = calculatePrayerTimeWithOffset(
          prayerTimingMap[Strings.maghreb()], offsetMaghrib);
    } else {
      prayerTimingMap.remove(Strings.maghreb());
    }

    if (_prayerNotificationModel.prayerSettings[Strings.salahMwaeed()[4]]) {
      String offsetIsha = SharedPrefrenceHelper()
          .getValueForKeyWithAlternativeValue(
          key: SharedPrefsKeys.ISHA_OFFSET, alternativeValue: "0")
          .toString();

      prayerTimingMap[Strings.eshaa()] = calculatePrayerTimeWithOffset(
          prayerTimingMap[Strings.eshaa()], offsetIsha);
    } else {
      prayerTimingMap.remove(Strings.eshaa());
    }

    return prayerTimingMap;
  }

  DateTime calculatePrayerTimeWithOffset(DateTime prayerDate, String offset) {
    prayerDate = prayerDate.add(new Duration(minutes: int.parse(offset)));

    if (Utilities.getPrayerSettingsFromSharedPrefs().isChangeToSummerTime &&
        Utilities.getActiveManualDaylightFromSharedPrefs()
            .activedaylightManual) {
      prayerDate = prayerDate.add(new Duration(hours: 1));
    }
    return prayerDate;
  }

  Future _configurePrayerNotifications(
      PrayerDataObject prayerDataObject,
      MedicationNotificationModel prayerTimeNotificationModel,
      NotificationSettings notificationSettings,
      String notificationKey) async {
    Map<String, DateTime> prayerTimingsMap = new Map();
    DateFormat dateFormat = new DateFormat("dd MMM yyyy HH:mm");

    prayerTimingsMap[Strings.fagr()] = dateFormat.parse(
        prayerDataObject.prayerDate.readable +
            " " +
            prayerDataObject.timings.fajr);
    prayerTimingsMap[Strings.shorouq()] = dateFormat.parse(
        prayerDataObject.prayerDate.readable +
            " " +
            prayerDataObject.timings.sunrise);

    prayerTimingsMap[Strings.duhr()] = dateFormat.parse(
        prayerDataObject.prayerDate.readable +
            " " +
            prayerDataObject.timings.dhuhr);
    prayerTimingsMap[Strings.asr()] = dateFormat.parse(
        prayerDataObject.prayerDate.readable +
            " " +
            prayerDataObject.timings.asr);
    prayerTimingsMap[Strings.maghreb()] = dateFormat.parse(
        prayerDataObject.prayerDate.readable +
            " " +
            prayerDataObject.timings.maghrib);
    prayerTimingsMap[Strings.eshaa()] = dateFormat.parse(
        prayerDataObject.prayerDate.readable +
            " " +
            prayerDataObject.timings.isha);

    int beforSunrise = SharedPrefrenceHelper()
        .getValueForKey(SharedPrefsKeys.ADHAN_FAJR_SLIDER_VALUE);
    if (beforSunrise != null && Utilities.switchFajrOn) {
      prayerTimingsMap[Strings.beforSunrise()] = dateFormat
          .parse(prayerDataObject.prayerDate.readable +
          " " +
          prayerDataObject.timings.sunrise)
          .subtract(Duration(minutes: beforSunrise));
    }

    String midNight =
    SharedPrefrenceHelper().getValueForKey(SharedPrefsKeys.MID_NIGHT);
    if (midNight != null && midNight != "" && Utilities.switchEsharOn) {
      prayerDataObject.timings.midnight = midNight;
      prayerTimingsMap[Strings.midNight()] = dateFormat.parse(
          prayerDataObject.prayerDate.readable +
              " " +
              prayerDataObject.timings.midnight);
    }


    for (String prayerName in prayerTimingsMap.keys) {
      DateTime prayerDate = prayerTimingsMap[prayerName];


      if (prayerDate.isAfter(DateTime.now())) {
        print(prayerDate);
        await _scheduleNotification(
            date: prayerDate,
            sound: (notificationSettings.isSilent != null &&
                notificationSettings.isSilent == true)
                ? null
                : notificationSettings.soundName,
            notificationKey: notificationKey,
            prayerName: prayerName,
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
        String prayerName,
        int numOfMin}) async {
    sound = _getSoundName(prayerName);

    bool playSound = false;

    if (sound != null && sound.contains("mecca2")) {
      sound = null; //"default sound.mp3";
      playSound = true;
    }
    if (sound != null && sound != "") {
      playSound = true;
      sound = sound.split(".").first;
      //  sound = "azan_sounds\\$sound";


      if (Platform.isIOS) {
        sound += "ios.mp3";
      }
    }
    print("the final sound is =======$sound");


    String channelId = "channelId_" + DateTime.now().microsecondsSinceEpoch.toString();
    String channelName = "channelId_" + DateTime.now().microsecondsSinceEpoch.toString();
    String channelDesc = "channelId_" + DateTime.now().microsecondsSinceEpoch.toString();

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName, channelDesc,
        playSound: playSound,
        sound: sound,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        largeIconBitmapSource: BitmapSource.Drawable,
        enableLights: true,
        enableVibration: false,
        ledOnMs: 1000,
        ledOffMs: 500);

    var iOSPlatformChannelSpecifics =
    IOSNotificationDetails(presentSound: playSound, sound: sound);

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    String notifBody = "";
    if (prayerName == Strings.shorouq()) {
      if (Strings.english ?? false) {
        notifBody = prayerName + " " + Strings.maoeed();
      } else {
        notifBody = Strings.maoeed() + " " + prayerName;
      }
    } else if (prayerName == Strings.beforSunrise()) {
      notifBody = Strings.notificatioPreSherouk();
    } else {
      if (Strings.english ?? false) {
        notifBody = prayerName + " " + Strings.prayerNotification();
      } else {
        notifBody = Strings.prayerNotification() + " " + prayerName;
      }
    }

    String title = "";
    DateFormat formater = DateFormat("h:mm aa","en");
    String firstTime = formater.format(date).split(" ").first;
    String secondTime = replaceAmPm(formater.format(date).toLowerCase().split(" ").last);
    String timeTitle = " ("+ firstTime+"" +secondTime+") ";
    if (prayerName == Strings.shorouq()) {
      title = prayerName+timeTitle;
    } else if (prayerName == Strings.beforSunrise()) {
      title = Strings.beforSunrise()+timeTitle;
    } else {
      if (Strings.english ?? false) {
        title = prayerName + " " + Strings.prayer()+timeTitle;
      } else {
        title = Strings.prayer() + " " + prayerName+ timeTitle;
      }
    }

    if (notificationKey == Strings.adhanPreTimeNotification()) {
      notifBody = Strings.notifBody(numOfMin, prayerName);
    }

    if (_canScheduleMoreNotifications(notificationKey)) {
      int id = notificationKey == Strings.adhanPreTimeNotification()
          ? _notificationBeforeAzanIndex += 1
          : _notificationAfterAzanIndex += 1;

      id += 3000; //

      await _flutterLocalNotificationsPlugin.schedule(
          id, title, notifBody, date, platformChannelSpecifics);
      // print(
      //    "data which is transferred to the plugin are ${androidPlatformChannelSpecifics.playSound} ${androidPlatformChannelSpecifics.sound}  ${Strings.prayer() + prayerName} ,, ${notifBody} ,, ${date} ,, ${platformChannelSpecifics.android.toMap()}");
    }
  }

  bool _canScheduleMoreNotifications(String notificationKey) =>
      (notificationKey == Strings.adhanPreTimeNotification() &&
          _notificationBeforeAzanIndex < _MAXIMUM_PENDING_NOTIFICATIONS) ||
          (notificationKey == Strings.adhanTimeNotification() &&
              _notificationAfterAzanIndex < _MAXIMUM_PENDING_NOTIFICATIONS);

  Future<bool> _removeOldNotifications(String notificationKey) async {
    bool canceled = true;
    if (notificationKey == Strings.adhanPreTimeNotification()) {
      _notificationBeforeAzanIndex = 0;
    } else {
      _notificationAfterAzanIndex = 1;
    }
    var pendingNotificationRequests =
    await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    // print("total pending notifications: ${pendingNotificationRequests.length}");
    for (var pendingNotificationRequest in pendingNotificationRequests) {
      int notificationId = pendingNotificationRequest.id;
      if (notificationKey == Strings.adhanPreTimeNotification() &&
          notificationId % 2 == 0) {
        //  print("before azan removed");
        //canceled =
        await _flutterLocalNotificationsPlugin.cancel(pendingNotificationRequest.id);

        return canceled;
      } else if (notificationKey == Strings.adhanTimeNotification() &&
          notificationId % 2 == 1) {
        //  print("@ azan removed");
        //canceled =
        await _flutterLocalNotificationsPlugin.cancel(pendingNotificationRequest.id);

        return canceled;
      }
    }
    return canceled;
  }

  reInitPrayerNotifications() async {
    print("=======================reInitPrayerNotifications");

    _currentMonthPrayerModelResponse =
        Utilities.getMainPrayerFromSharedPreference();
    // print(
    //   "_currentMonthPrayerModelResponse===${_currentMonthPrayerModelResponse}");
    _notificationBeforeAzanIndex = 0;
    _notificationAfterAzanIndex = 1;
/*    if (_isAtEndOfMonth() && _currentMonthPrayerModelResponse != null) {
      // print('at end of month');
      PrayerModelResponse nextMonthResponse =
          await _getPrayerTimesForNextMonth(DateTime.now().month + 1);
      DateFormat format = DateFormat("dd MMM yyyy");

      _currentMonthPrayerModelResponse.prayerDataObject
          .addAll(nextMonthResponse.prayerDataObject.where((nextPrayerDate)=> format.parse(nextPrayerDate.prayerDate.readable).day <= DateTime.now().day ));
      // print(
      //     'after appending ${_currentMonthPrayerModelResponse.prayerDataObject.length}');
    }*/
    await _flutterLocalNotificationsPlugin.cancelAll();
    //await _scheduleAgain(Strings.adhanPreTimeNotification());
    await _scheduleAgain(Strings.adhanTimeNotification());
  }

  cancelAllNotifications() {
    _notificationBeforeAzanIndex = 0;
    _flutterLocalNotificationsPlugin.cancelAll();
  }

/*
  //for test purpose
  scheduleTestNotification() async {
    DateFormat dateFormat = new DateFormat("dd MMM yyyy HH:mm");

    var scheduledNotificationDateTime = dateFormat.parse("14 Oct 2019 04:31");
    // print('scheduled date $scheduledNotificationDateTime');

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description',
        icon: 'secondary_icon',
        sound: 'algeria',
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: "meccaios.mp3", presentSound: true);

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        DateTime.now().add(Duration(seconds: 5)),
        platformChannelSpecifics);
  }*/

  static Future<void> _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // print('received local notification');
  }

  static Future<void> _onSelectNotification(String payload) async {
    // print('selected notification');
  }

  Future<PrayerModelResponse> _getPrayerTimesForNextMonth(int nextMonth) async {
    if (nextMonth == 13) {
      nextMonth = 1;
    }
    return await PrayerRepo().getPrayerTimesForMonth(
        locationModel: Utilities.getCordinateFromSharedPreference(),
        miladiMonth: nextMonth,
        year: nextMonth == 1 ? DateTime.now().year + 1 : DateTime.now().year,
        shouldCacheResponse: false);
  }

  String _getSoundName(String azanName) {
    //solve sound of midnight and before sunrise
    if (azanName == Strings.beforSunrise())  {
      NotificationSettings notificationSettings =
      Utilities.getNotificationSettingsFromSharedPrefs(
          SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_FAJR)
          ?.timeNotificationMap[Strings.adhanPreTimeNotification()];
      return notificationSettings.soundName.toLowerCase();
    }
    if (azanName == Strings.midNight())  {
      NotificationSettings notificationSettings =
      Utilities.getNotificationSettingsFromSharedPrefs(
          SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_ESHA)
          ?.timeNotificationMap[Strings.adhanPreTimeNotification()];
      return notificationSettings.soundName.toLowerCase();
    }
    //
    Map<String, NotificationSettings> notfSettings =
        Utilities.getNotificationSettingsFromSharedPrefs(
            _getMappedKey(azanName))
            ?.timeNotificationMap;

    if (notfSettings != null) {
      NotificationSettings notificationSettings =
      notfSettings[Strings.adhanTimeNotification()];
      String soundName =
      notificationSettings.soundName.replaceAll("azan_sounds/", "");

      if (azanName == Strings.fagr()) {
        if (Platform.isIOS) {
          return soundName.replaceAll("_fajr", "");
        }
      }
      return soundName;
    } else {
      return null;
    }

    // print("the data saved ==${notificationSettings.toJson()}");

    //  print(
    //     "key==== $azanName value sound name>>>>>======== ${notificationSettings.soundName}");
  }

  String _getMappedKey(String azanName) {
    if (azanName == Strings.fagr()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_FAJR;
    } else if (azanName == Strings.shorouq()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_SHROQ;
    } else if (azanName == Strings.duhr()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_ZOHR;
    } else if (azanName == Strings.asr()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_ASR;
    } else if (azanName == Strings.maghreb()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_MAGHREB;
    } else if (azanName == Strings.eshaa()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_ESHA;
    } else if (azanName == Strings.midNight()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_ESHA;
    } else if (azanName == Strings.beforSunrise()) {
      return SharedPrefsKeys.ADHAN_NOTIFICATION_SETTINGS_FOR_FAJR;
    }
    print(azanName);
  }

  String replaceAmPm(String prayT) {
    if (prayT == "am" && Strings.english ?? false /* == true*/) {
      return prayT = " am";
    } else if (prayT == "am" && !Strings.english ?? false/*== false*/) {
      return prayT = " ص";
    } else if ((prayT == "pm" && Strings.english ?? false/*== true*/)) {
      return prayT = " pm";
    } else if ((prayT == "pm" && !Strings.english ?? false /* == false*/)) {
      return prayT = " م";
    }
    return "";
  }

}
