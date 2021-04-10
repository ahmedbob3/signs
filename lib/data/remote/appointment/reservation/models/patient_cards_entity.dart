import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class PatientCardsEntity with JsonConvert<PatientCardsEntity> {
	int code;
	String status;
	List<PatientCardsData> data;
}

class PatientCardsData with JsonConvert<PatientCardsData> {
	@JSONField(name: "pi_id")
	String piId;
	@JSONField(name: "pi_id_card")
	String piIdCard;
	@JSONField(name: "pi_card_image")
	String piCardImage;
}
