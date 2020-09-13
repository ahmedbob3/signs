// To parse this JSON data, do
//
//     final checkNumberModel = checkNumberModelFromMap(jsonString);

import 'dart:convert';

CheckMobileModel checkNumberModelFromMap(String str) => CheckMobileModel.fromMap(json.decode(str));

String checkNumberModelToMap(CheckMobileModel data) => json.encode(data.toMap());

class CheckMobileModel {
    CheckMobileModel({
        this.code,
        this.status,
        this.msg,
        this.data,
    });

    final int code;
    final String status;
    final String msg;
    final Data data;

    factory CheckMobileModel.fromMap(Map<String, dynamic> json) => CheckMobileModel(
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
    Data();

    factory Data.fromMap(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toMap() => {
    };
}
