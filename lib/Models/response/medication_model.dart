// To parse this JSON data, do
//
//     final medicationsModel = medicationsModelFromMap(jsonString);

import 'dart:convert';

class MedicationsModel {
  MedicationsModel({
    this.code,
    this.status,
    this.data,
  });

  final int code;
  final String status;
  final List<Datum> data;

  factory MedicationsModel.fromJson(String str) =>
      MedicationsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicationsModel.fromMap(Map<String, dynamic> json) {
    List<dynamic> data = [];
    if (json["data"] is List)
      data = json["data"];
    else
      data = [];
    return MedicationsModel(
      code: json["code"],
      status: json["status"],
      data: data != null ? List<Datum>.from(data.map((x) => Datum.fromMap(x))) : [],
    );
  }

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.mId,
    this.mName,
    this.mDose,
    this.mDuration,
    this.mReminderNote,
    this.mfName,
    this.mfImage,
    this.rememberTime,
  });

  final String mId;
  final String mName;
  final String mDose;
  final String mDuration;
  final String mReminderNote;
  final MfName mfName;
  final String mfImage;
  final List<String> rememberTime;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        mId: json["m_id"],
        mName: json["m_name"],
        mDose: json["m_dose"],
        mDuration: json["m_duration"],
        mReminderNote: json["m_reminder_note"],
        mfName: mfNameValues.map[json["mf_name"]],
        mfImage: json["mf_image"],
        rememberTime: List<String>.from(json["remember_time"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "m_id": mId,
        "m_name": mName,
        "m_dose": mDose,
        "m_duration": mDuration,
        "m_reminder_note": mReminderNote,
        "mf_name": mfNameValues.reverse[mfName],
        "mf_image": mfImage,
        "remember_time": List<dynamic>.from(rememberTime.map((x) => x)),
      };
}

enum MfName { TABLET, CAPSULES }

final mfNameValues =
    EnumValues({"Capsules": MfName.CAPSULES, "Tablet": MfName.TABLET});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
