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
	data.data = (json['data'] as List)?.map((v) => HospitalSpecialitiesData().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> hospitalSpecialitiesEntityToJson(HospitalSpecialitiesEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

hospitalSpecialitiesDataFromJson(HospitalSpecialitiesData data, Map<String, dynamic> json) {
	if (json['s_id'] != null) {
		data.sId = json['s_id'].toString();
	}
	if (json['s_name'] != null) {
		data.sName = json['s_name'].toString();
	}
	if (json['s_active_icon'] != null) {
		data.sActiveIcon = json['s_active_icon'].toString();
	}
	if (json['s_selected_icon'] != null) {
		data.sSelectedIcon = json['s_selected_icon'].toString();
	}
	if (json['isSelected'] != null) {
		data.isSelected = json['isSelected'];
	}
	return data;
}

Map<String, dynamic> hospitalSpecialitiesDataToJson(HospitalSpecialitiesData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['s_id'] = entity.sId;
	data['s_name'] = entity.sName;
	data['s_active_icon'] = entity.sActiveIcon;
	data['s_selected_icon'] = entity.sSelectedIcon;
	data['isSelected'] = entity.isSelected;
	return data;
}