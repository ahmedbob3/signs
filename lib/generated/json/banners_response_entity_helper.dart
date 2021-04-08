import 'package:Signs/data/remote/appointment/hospital/models/banners_response_entity.dart';

bannersResponseEntityFromJson(BannersResponseEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => Banners().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> bannersResponseEntityToJson(BannersResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

bannersFromJson(Banners data, Map<String, dynamic> json) {
	if (json['b_id'] != null) {
		data.bId = json['b_id'].toString();
	}
	if (json['b_from_date'] != null) {
		data.bFromDate = json['b_from_date'].toString();
	}
	if (json['b_from_time'] != null) {
		data.bFromTime = json['b_from_time'].toString();
	}
	if (json['b_to_date'] != null) {
		data.bToDate = json['b_to_date'].toString();
	}
	if (json['b_to_time'] != null) {
		data.bToTime = json['b_to_time'].toString();
	}
	if (json['b_show'] != null) {
		data.bShow = json['b_show'].toString();
	}
	if (json['b_image'] != null) {
		data.bImage = json['b_image'].toString();
	}
	return data;
}

Map<String, dynamic> bannersToJson(Banners entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['b_id'] = entity.bId;
	data['b_from_date'] = entity.bFromDate;
	data['b_from_time'] = entity.bFromTime;
	data['b_to_date'] = entity.bToDate;
	data['b_to_time'] = entity.bToTime;
	data['b_show'] = entity.bShow;
	data['b_image'] = entity.bImage;
	return data;
}