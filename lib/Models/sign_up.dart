// To parse this JSON data, do
//
//     final sigUpModel = sigUpModelFromMap(jsonString);

import 'dart:convert';

SigUpModel sigUpModelFromMap(String str) => SigUpModel.fromMap(json.decode(str));

String sigUpModelToMap(SigUpModel data) => json.encode(data.toMap());

class SigUpModel {
    SigUpModel({
        this.code,
        this.status,
        this.msg,
        this.data,
    });

    int code;
    String status;
    String msg;
    Data data;

    factory SigUpModel.fromMap(Map<String, dynamic> json) => SigUpModel(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": data.toMap(),
    };
}

class Data {
    Data({
        this.uId,
        this.uMobile,
        this.uFirstName,
        this.uLastName,
        this.uEmail,
        this.uGender,
        this.uBirthDate,
        this.uWeight,
        this.uHeight,
        this.uBedTime,
        this.uWakeUp,
    });

    String uId;
    String uMobile;
    String uFirstName;
    String uLastName;
    String uEmail;
    String uGender;
    DateTime uBirthDate;
    String uWeight;
    String uHeight;
    String uBedTime;
    String uWakeUp;

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        uId: json["u_id"],
        uMobile: json["u_mobile"],
        uFirstName: json["u_first_name"],
        uLastName: json["u_last_name"],
        uEmail: json["u_email"],
        uGender: json["u_gender"],
        uBirthDate: json["u_birth_date"] == '' ? null : DateTime.parse(json["u_birth_date"]),
        uWeight: json["u_weight"],
        uHeight: json["u_height"],
        uBedTime: json["u_bed_time"],
        uWakeUp: json["u_wake_up"],
    );

    Map<String, dynamic> toMap() => {
        "u_id": uId,
        "u_mobile": uMobile,
        "u_first_name": uFirstName,
        "u_last_name": uLastName,
        "u_email": uEmail,
        "u_gender": uGender,
        "u_birth_date": uBirthDate?? "${uBirthDate.year.toString().padLeft(4, '0')}-${uBirthDate.month.toString().padLeft(2, '0')}-${uBirthDate.day.toString().padLeft(2, '0')}",
        "u_weight": uWeight,
        "u_height": uHeight,
        "u_bed_time": uBedTime,
        "u_wake_up": uWakeUp,
    };
}
