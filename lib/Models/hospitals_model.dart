// To parse this JSON data, do
//
//     final hospitalsModel = hospitalsModelFromMap(jsonString);

import 'dart:convert';

HospitalsModel hospitalsModelFromMap(String str) => HospitalsModel.fromMap(json.decode(str));

String hospitalsModelToMap(HospitalsModel data) => json.encode(data.toMap());

class HospitalsModel {
    HospitalsModel({
        this.code,
        this.status,
        this.data,
    });

    final int code;
    final String status;
    final List<Datum> data;

    factory HospitalsModel.fromMap(Map<String, dynamic> json) => HospitalsModel(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Datum {
    Datum({
        this.hId,
        this.hName,
        this.hLocation,
        this.hAbout,
        this.hPhone,
        this.hLatlang,
        this.hImage,
        this.hIcon,
        this.gallery,
        this.hasOnlineAppointment,
        this.hasPhysicalAppointment,
        this.hasMedicalHistory,
        this.hasEmergencyCall
    });

    final String hId;
    final String hName;
    final String hLocation;
    final String hAbout;
    final String hPhone;
    final String hLatlang;
    final String hImage;
    final String hIcon;
    final List<String> gallery;
    final int hasOnlineAppointment;
    final int hasPhysicalAppointment;
    final int hasMedicalHistory;
    final int hasEmergencyCall;

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        hId: json["h_id"],
        hName: json["h_name"],
        hLocation: json["h_location"],
        hAbout: json["h_about"],
        hPhone: json["h_phone"],
        hLatlang: json["h_latlang"],
        hImage: json["h_image"],
        hIcon: json["h_icon"],
        hasOnlineAppointment: int.parse(json["h_online_appointment"]),
        hasPhysicalAppointment: int.parse(json["h_physical_appointment"]),
        hasMedicalHistory: int.parse(json["h_medical_history"]),
        hasEmergencyCall: int.parse(json["h_emergency_call"]),
        gallery: List<String>.from(json["gallery"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "h_id": hId,
        "h_name": hName,
        "h_location": hLocation,
        "h_about": hAbout,
        "h_phone": hPhone,
        "h_latlang": hLatlang,
        "h_image": hImage,
        "h_icon": hIcon,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
    };
}
