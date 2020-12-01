class MedicationTimesSettings {
  // this two variable define should recaluclate prayer times from local or get them from server
  bool mustGetPrayerTimesFromServer;
  bool mustRecalculateLocalPrayerTimes;

  // these varable define which setting is changes already
  bool isChangeToSummerTime;
  bool isChangeFqhAsr;
  bool isChangeManualCorrection;
  bool isChangeMazhabAzan; //umm qoura , karachi ,....
  bool isChangeToAutomaticSettings;
  bool activedaylightManual;

  MedicationTimesSettings(
      {this.mustGetPrayerTimesFromServer = true,
      this.mustRecalculateLocalPrayerTimes = false,
      this.isChangeFqhAsr = false,
      this.isChangeManualCorrection = false,
      this.isChangeMazhabAzan = false,
      this.isChangeToAutomaticSettings = true,
      this.isChangeToSummerTime = false,
      this.activedaylightManual = true
      });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mustGetPrayerTimesFromServer'] = this.mustGetPrayerTimesFromServer;
    data['mustRecalculateLocalPrayerTimes'] =
        this.mustRecalculateLocalPrayerTimes;
    data['isChangeFqhAsr'] = this.isChangeFqhAsr;
    data['isChangeManualCorrection'] = this.isChangeManualCorrection;
    data['isChangeMazhabAzan'] = this.isChangeMazhabAzan;
    data['isChangeToAutomaticSettings'] = this.isChangeToAutomaticSettings;
    data['isChangeToSummerTime'] = this.isChangeToSummerTime;
    data['activedaylightManual'] = this.activedaylightManual;
    return data;
  }

  MedicationTimesSettings.fromJson(Map<String, dynamic> json) {
    this.mustGetPrayerTimesFromServer = json['mustGetPrayerTimesFromServer'];
    this.mustRecalculateLocalPrayerTimes =
        json['mustRecalculateLocalPrayerTimes'];
    this.isChangeFqhAsr = json['isChangeFqhAsr'];
    this.isChangeManualCorrection = json['isChangeManualCorrection'];
    this.isChangeMazhabAzan = json['isChangeMazhabAzan'];
    this.isChangeToAutomaticSettings = json['isChangeToAutomaticSettings'];
    this.isChangeToSummerTime = json['isChangeToSummerTime'];
    this.activedaylightManual = json['activedaylightManual'];
  }
}
