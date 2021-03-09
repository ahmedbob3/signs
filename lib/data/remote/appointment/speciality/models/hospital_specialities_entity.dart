import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class HospitalSpecialitiesEntity with JsonConvert<HospitalSpecialitiesEntity> {
	int code;
	String status;
	List<HospitalSpeciality> data = [];
}

class HospitalSpeciality with JsonConvert<HospitalSpeciality> {

	HospitalSpeciality({this.id, this.name});
	@JSONField(name: "s_id")
	String id;
	@JSONField(name: "s_name")
	String name;
	@JSONField(name: "s_unselected_icon")
	String unselectedIcon = "";
	@JSONField(name: "s_selected_icon")
	String selectedIcon = "";
	@JSONField(name: "s_keywords")
	String keywords;
	bool isSelected = false;
}
