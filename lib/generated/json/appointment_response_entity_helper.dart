import 'package:Signs/data/remote/appointment/models/appointment_response_entity.dart';

appointmentResponseEntityFromJson(AppointmentResponseEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => AppointmentResponseData().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> appointmentResponseEntityToJson(AppointmentResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

appointmentResponseDataFromJson(AppointmentResponseData data, Map<String, dynamic> json) {
	if (json['a_id'] != null) {
		data.aId = json['a_id'].toString();
	}
	if (json['a_status'] != null) {
		data.aStatus = json['a_status'].toString();
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
	if (json['d_name'] != null) {
		data.dName = json['d_name'].toString();
	}
	if (json['d_title'] != null) {
		data.dTitle = json['d_title'].toString();
	}
	if (json['s_name'] != null) {
		data.sName = json['s_name'].toString();
	}
	if (json['h_location'] != null) {
		data.hLocation = json['h_location'].toString();
	}
	if (json['h_name'] != null) {
		data.hName = json['h_name'].toString();
	}
	if (json['h_latlang'] != null) {
		data.hLatlang = json['h_latlang'].toString();
	}
	if (json['d_image'] != null) {
		data.dImage = json['d_image'].toString();
	}
	return data;
}

Map<String, dynamic> appointmentResponseDataToJson(AppointmentResponseData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['a_id'] = entity.aId;
	data['a_status'] = entity.aStatus;
	data['ds_type'] = entity.dsType;
	data['ds_date'] = entity.dsDate;
	data['ds_time'] = entity.dsTime;
	data['d_name'] = entity.dName;
	data['d_title'] = entity.dTitle;
	data['s_name'] = entity.sName;
	data['h_location'] = entity.hLocation;
	data['h_name'] = entity.hName;
	data['h_latlang'] = entity.hLatlang;
	data['d_image'] = entity.dImage;
	return data;
}