import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';

doctorsEntityFromJson(DoctorsEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => Doctor().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> doctorsEntityToJson(DoctorsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

doctorFromJson(Doctor data, Map<String, dynamic> json) {
	if (json['d_id'] != null) {
		data.id = json['d_id'].toString();
	}
	if (json['d_name'] != null) {
		data.name = json['d_name'].toString();
	}
	if (json['s_name'] != null) {
		data.speciality = json['s_name'].toString();
	}
	if (json['d_title'] != null) {
		data.bio = json['d_title'].toString();
	}
	if (json['d_image'] != null) {
		data.imageUrl = json['d_image'].toString();
	}
	return data;
}

Map<String, dynamic> doctorToJson(Doctor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['d_id'] = entity.id;
	data['d_name'] = entity.name;
	data['s_name'] = entity.speciality;
	data['d_title'] = entity.bio;
	data['d_image'] = entity.imageUrl;
	return data;
}