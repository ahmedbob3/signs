// To parse this JSON data, do
//
//     final subaccountsModel = subaccountsModelFromMap(jsonString);

import 'dart:convert';

class SubaccountsModel {
  SubaccountsModel({
    this.code,
    this.status,
    this.data,
  });

  final int code;
  final String status;
  final List<Data> data;

  factory SubaccountsModel.fromJson(String str) =>
      SubaccountsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubaccountsModel.fromMap(Map<dynamic, dynamic> json) {
    List<dynamic> data = [];
    if (json["data"] is List)
      data = json["data"];
    else
      data = null;

    return SubaccountsModel(
        code: json["code"],
        status: json["status"],
        data: data != null ?List<Data>.from(data.map((x) => Data.fromMap(x))) : []);
  }

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Data {
  Data({
    this.saId,
    this.saFirstName,
    this.saLastName,
    this.saGender,
    this.saRelation,
  });

  final String saId;
  final String saFirstName;
  final String saLastName;
  final String saGender;
  final String saRelation;
  bool isSelected = false;

  factory Data.fromJson(dynamic str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<dynamic, dynamic> json) => Data(
        saId: json["sa_id"],
        saFirstName: json["sa_first_name"],
        saLastName: json["sa_last_name"],
        saGender: json["sa_gender"],
        saRelation: json["sa_relation"],
      );

  Map<dynamic, dynamic> toMap() => {
        "sa_id": saId,
        "sa_first_name": saFirstName,
        "sa_last_name": saLastName,
        "sa_gender": saGender,
        "sa_relation": saRelation,
      };
}
