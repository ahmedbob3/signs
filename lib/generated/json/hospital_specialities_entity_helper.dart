import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';

hospitalSpecialitiesEntityFromJson(HospitalSpecialitiesEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => HospitalSpeciality().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> hospitalSpecialitiesEntityToJson(HospitalSpecialitiesEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

hospitalSpecialitiesDataFromJson(HospitalSpeciality data, Map<String, dynamic> json) {
	if (json['s_id'] != null) {
		data.id = json['s_id'].toString();
	}
	if (json['s_name'] != null) {
		data.name = json['s_name'].toString();
	}
	if (json['s_unselected_icon'] != null) {
		data.unselectedIcon = json['s_unselected_icon'].toString();
	}
	if (json['s_selected_icon'] != null) {
		data.selectedIcon = json['s_selected_icon'].toString();
	}
	if (json['s_keywords'] != null) {
		data.keywords = json['s_keywords'].toString();
	}
	if (json['isSelected'] != null) {
		data.isSelected = json['isSelected'];
	}
	return data;
}

Map<String, dynamic> hospitalSpecialitiesDataToJson(HospitalSpeciality entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['s_id'] = entity.id;
	data['s_name'] = entity.name;
	data['s_unselected_icon'] = entity.unselectedIcon;
	data['s_selected_icon'] = entity.selectedIcon;
	data['s_keywords'] = entity.keywords;
	data['isSelected'] = entity.isSelected;
	return data;
}