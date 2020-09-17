// To parse this JSON data, do
//
//     final checkNumberModel = checkNumberModelFromMap(jsonString);

import 'dart:convert';

SigUpModel checkNumberModelFromMap(String str) => SigUpModel.fromMap(json.decode(str));

String checkNumberModelToMap(SigUpModel data) => json.encode(data.toMap());

class SigUpModel {
    SigUpModel({
        this.code,
        this.status,
        this.msg,
        this.data,
    });

    final int code;
    final String status;
    final String msg;
    final Data data;

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
    Data();

    factory Data.fromMap(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toMap() => {
    };
}
