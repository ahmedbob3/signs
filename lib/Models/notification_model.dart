import 'dart:async';

import 'package:flutter/material.dart';

class NotificationSettings {
  bool isSilent;
  int numberOfMinutes;
  String soundName;
  String doaaName = "";
  int groupID = -1;
  static const String DEFAULT_SOUND_NAME = "azan_sounds/mecca2.mp3";
  static const String DEFAULT_SOUND_NAME_FOR_MOBILE = "normal sound for isha3arat";

  NotificationSettings(
      {this.isSilent = false,
      this.numberOfMinutes = 0,
      this.soundName = DEFAULT_SOUND_NAME,
      this.groupID,
      this.doaaName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSilent'] = this.isSilent;
    data['numberOfMinutes'] = this.numberOfMinutes;
    data['soundName'] = this.soundName;
    data['groupID'] = this.groupID;
    data['doaaName'] = this.doaaName;
    return data;
  }

  NotificationSettings.fromJson(Map<String, dynamic> json) {
    this.isSilent = json['isSilent'];
    this.numberOfMinutes = json['numberOfMinutes'];
    this.soundName = json['soundName'];
    this.groupID = json['groupID'];
    this.doaaName = json['doaaName'];
  }
}
