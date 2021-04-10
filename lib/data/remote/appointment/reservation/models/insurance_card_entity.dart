import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class InsuranceCardEntity with JsonConvert<InsuranceCardEntity> {
	int code;
	String status;
	List<InsuranceCardData> data;
}

class InsuranceCardData with JsonConvert<InsuranceCardData> {
	@JSONField(name: "pmc_id")
	String pmcId;
	@JSONField(name: "pmc_medical_card")
	String pmcMedicalCard;
	@JSONField(name: "pmc_card_image")
	String pmcCardImage;
	bool isSelected = false;
}
