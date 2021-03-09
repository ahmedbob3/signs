import 'package:Signs/data/remote/appointment/doctors/models/doctor_details_entity.dart';

doctorDetailsEntityFromJson(DoctorDetailsEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => DoctorDetails().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> doctorDetailsEntityToJson(DoctorDetailsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

doctorDetailsFromJson(DoctorDetails data, Map<String, dynamic> json) {
	if (json['d_id'] != null) {
		data.id = json['d_id'].toString();
	}
	if (json['d_name'] != null) {
		data.name = json['d_name'].toString();
	}
	if (json['d_title'] != null) {
		data.bio = json['d_title'].toString();
	}
	if (json['d_about'] != null) {
		data.description = json['d_about'].toString();
	}
	if (json['s_name'] != null) {
		data.speciality = json['s_name'].toString();
	}
	if (json['d_experience_year'] != null) {
		data.dExperienceYear = json['d_experience_year'].toString();
	}
	if (json['d_image'] != null) {
		data.dImage = json['d_image'].toString();
	}
	data.achievements = (json['gallery'] as List)?.map((v) => v.toString())?.toList()?.cast<String>();
	data.videos = (json['videos'] as List)?.map((v) => v.toString())?.toList()?.cast<String>();
	data.articles = (json['articles'] as List)?.map((v) => v.toString())?.toList()?.cast<String>();
	return data;
}

Map<String, dynamic> doctorDetailsToJson(DoctorDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['d_id'] = entity.id;
	data['d_name'] = entity.name;
	data['d_title'] = entity.bio;
	data['d_about'] = entity.description;
	data['s_name'] = entity.speciality;
	data['d_experience_year'] = entity.dExperienceYear;
	data['d_image'] = entity.dImage;
	data['gallery'] = entity.achievements;
	data['videos'] = entity.videos;
	data['articles'] = entity.articles;
	return data;
}