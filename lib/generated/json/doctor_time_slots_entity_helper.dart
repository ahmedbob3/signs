import 'package:Signs/data/remote/appointment/reservation/models/doctor_time_slots_entity.dart';

doctorTimeSlotsEntityFromJson(DoctorTimeSlotsEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => DoctorTimeSlot().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> doctorTimeSlotsEntityToJson(DoctorTimeSlotsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

doctorTimeSlotsDataFromJson(DoctorTimeSlot data, Map<String, dynamic> json) {
	if (json['ds_id'] != null) {
		data.dsId = json['ds_id'].toString();
	}
	if (json['ds_d_id'] != null) {
		data.dsDId = json['ds_d_id'].toString();
	}
	if (json['ds_type'] != null) {
		data.dsType = json['ds_type'].toString();
	}
	if (json['ds_date'] != null) {
		data.dsDate = json['ds_date'].toString();
	}
	if (json['ds_time'] != null) {
		data.dsTime = json['ds_time'].toString();
	}
	if (json['ds_avaliable'] != null) {
		data.dsAvaliable = json['ds_avaliable'].toString();
	}
	return data;
}

Map<String, dynamic> doctorTimeSlotsDataToJson(DoctorTimeSlot entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ds_id'] = entity.dsId;
	data['ds_d_id'] = entity.dsDId;
	data['ds_type'] = entity.dsType;
	data['ds_date'] = entity.dsDate;
	data['ds_time'] = entity.dsTime;
	data['ds_avaliable'] = entity.dsAvaliable;
	return data;
}