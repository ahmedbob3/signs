// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) =>
    LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  LoginModel({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  final int code;
  final String status;
  final String msg;
  final Data data;

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
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
    this.uRelation,

  });

   String uId;
  final String uMobile;
   String uFirstName;
   String uLastName;
  final String uEmail;
  final String uGender;
  final String uBirthDate;
  final String uWeight;
  final String uHeight;
  final String uBedTime;
  final String uWakeUp;
  String uRelation;
  bool isSelected = false;


  factory Data.fromMap(Map<String, dynamic> json) => Data(
            uId: json["u_id"],

        uMobile: json["u_mobile"],
        uFirstName: json["u_first_name"],
        uLastName: json["u_last_name"],
        uEmail: json["u_email"],
        uGender: json["u_gender"],
        uBirthDate: json["u_birth_date"],
        uWeight: json["u_weight"],
        uHeight: json["u_height"],
        uBedTime: json["u_bed_time"],
        uWakeUp: json["u_wake_up"],
      uRelation :"",
      );

  Map<String, dynamic> toMap() => {
            "u_id": uId,

        "u_mobile": uMobile,
        "u_first_name": uFirstName,
        "u_last_name": uLastName,
        "u_email": uEmail,
        "u_gender": uGender,
        "u_birth_date": uBirthDate,
        "u_weight": uWeight,
        "u_height": uHeight,
        "u_bed_time": uBedTime,
        "u_wake_up": uWakeUp,
    "uRelation":uRelation,
      };
}
