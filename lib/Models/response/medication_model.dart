// To parse this JSON data, do
//
//     final medicationsModel = medicationsModelFromMap(jsonString);

import 'dart:convert';

import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';

class MedicationsModel {
  MedicationsModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  final int code;
  final String status;
  final String msg;
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
      msg: json["msg"],
      status: json["status"],
      data: data != null ? List<Datum>.from(data.map((x) => Datum.fromMap(x))) : [],
    );
  }

  Map<String, dynamic> toMap() => {
        "code": code,
        "msg": msg,
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
    this.isActive,
    this.createdDatetime,
    this.lessTime,

  });

  String mId;
  String mName;
  String mDose;
  String mDuration;
  String mReminderNote;
  String mfName;
  String mfImage;
  List<String> rememberTime;
  String isActive;
  String lessTime;
  String createdDatetime;

  void setmId(String mNumber) {
    mId=mNumber;
  }
  void setmName(String fName) {
    mName=fName;
  }
  void setmDose(String lName) {
    mDose=lName;
  }
  void setmDuration(String em) {
    mDuration=em;
  }
  void setmReminderNote(String pass) {
    mReminderNote=pass;
  }
  void setmfName(String gen) {
    mfName=gen;
  }
  void setmfImage(String bir) {
    mfImage=bir;
  }

  void setrememberTime(List<String> bir) {
    rememberTime=bir;
  }

  void setisActive(String bir) {
    isActive=bir;
  }

  void setlessTime(String bir) {
    lessTime=bir;
  }

  void setcreatedDatetime(String bir) {
    createdDatetime=bir;
  }



  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        mId: json["m_id"],
        mName: json["m_name"],
        mDose: json["m_dose"],
        mDuration: (json["m_duration"]).toString(),
        mReminderNote: json["m_reminder_note"],
        mfName: mfNameValues.map[json["mf_id"]],
        mfImage: mfImageValues.map[json["mf_id"]],
        rememberTime: List<String>.from(json["remember_time"].map((x) => x)),
        isActive: json["m_active"].toString(),
        createdDatetime : json["m_created_datetime"].toString(),
        lessTime: ""


  );

  Map<String, dynamic> toMap() => {
        "m_id": mId,
        "m_name": mName,
        "m_dose": mDose,
        "m_duration": mDuration,
        "m_reminder_note": mReminderNote,
        "mf_name": mfName,
        "mf_image": mfImage,
        "remember_time": List<dynamic>.from(rememberTime.map((x) => x)),
        "m_active": isActive,
        "m_created_datetime":createdDatetime,
          "lessTime": lessTime


  };
}

// enum MfName { TABLET, CAPSULES ,}

final mfNameValues =
    EnumValues({
      "1": Strings().getCapsuleStrings(),
      "2": Strings().getTabletStrings(),
      "3": Strings().getLiquidStrings(),
      "4": Strings().getDropsStrings(),
      "5": Strings().getSuppositoryStrings(),
      "6": Strings().getTopicalStrings(),
      "7": Strings().getSachetsStrings(),
      "8": Strings().getInhalersStrings(),
      "9": Strings().getImplantsStrings(),
      "10": Strings().getPatchesStrings() ,
      "11": Strings().getInjectionsStrings()
    });


final mfImageValues =
    EnumValues({
      "1": Capsule_active,
      "2": Tablet_active,
      "3": Liquid_active,
      "4": Drops_Active,
      "5": Suppository_active,
      "6": Topical_active,
      "7": Sachets_active,
      "8": Inhalator_active,
      "9": Implant_active,
      "10": Patches_active,
      "11":  Injection_active
    });

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
