import 'package:Signs/data/remote/appointment/reservation/models/insurance_card_entity.dart';

insuranceCardEntityFromJson(InsuranceCardEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	data.data = (json['data'] as List)?.map((v) => InsuranceCardData().fromJson(v))?.toList();
	return data;
}

Map<String, dynamic> insuranceCardEntityToJson(InsuranceCardEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

insuranceCardDataFromJson(InsuranceCardData data, Map<String, dynamic> json) {
	if (json['pmc_id'] != null) {
		data.pmcId = json['pmc_id'].toString();
	}
	if (json['pmc_medical_card'] != null) {
		data.pmcMedicalCard = json['pmc_medical_card'].toString();
	}
	if (json['pmc_card_image'] != null) {
		data.pmcCardImage = json['pmc_card_image'].toString();
	}
	if (json['isSelected'] != null) {
		data.isSelected = json['isSelected'];
	}
	return data;
}

Map<String, dynamic> insuranceCardDataToJson(InsuranceCardData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pmc_id'] = entity.pmcId;
	data['pmc_medical_card'] = entity.pmcMedicalCard;
	data['pmc_card_image'] = entity.pmcCardImage;
	data['isSelected'] = entity.isSelected;
	return data;
}