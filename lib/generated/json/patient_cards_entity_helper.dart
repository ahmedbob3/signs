import 'package:Signs/data/remote/appointment/reservation/models/patient_cards_entity.dart';

patientCardsEntityFromJson(PatientCardsEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => PatientCardsData().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> patientCardsEntityToJson(PatientCardsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

patientCardsDataFromJson(PatientCardsData data, Map<String, dynamic> json) {
	if (json['pi_id'] != null) {
		data.piId = json['pi_id'].toString();
	}
	if (json['pi_id_card'] != null) {
		data.piIdCard = json['pi_id_card'].toString();
	}
	if (json['pi_card_image'] != null) {
		data.piCardImage = json['pi_card_image'].toString();
	}
	if (json['isSelected'] != null) {
		data.isSelected = json['isSelected'];
	}
	return data;
}

Map<String, dynamic> patientCardsDataToJson(PatientCardsData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pi_id'] = entity.piId;
	data['pi_id_card'] = entity.piIdCard;
	data['pi_card_image'] = entity.piCardImage;
	data['isSelected'] = entity.isSelected;
	return data;
}