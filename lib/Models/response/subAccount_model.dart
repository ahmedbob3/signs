
import 'dart:convert';



class SubAccountModel {
    SubAccountModel({
        this.code,
        this.status,
        this.msg,
        this.data,
    });

    final int code;
    final String status;
    final String msg;
    final Data data;

    factory SubAccountModel.fromMap(Map<String, dynamic> json) => SubAccountModel(
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
