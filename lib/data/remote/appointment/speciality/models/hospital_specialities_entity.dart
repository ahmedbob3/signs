import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class HospitalSpecialitiesEntity with JsonConvert<HospitalSpecialitiesEntity> {
	int code;
	String status;
	List<HospitalSpecialitiesData> data;
}

class HospitalSpecialitiesData with JsonConvert<HospitalSpecialitiesData> {
	@JSONField(name: "s_id")
	String sId;
	@JSONField(name: "s_name")
	String sName;
	@JSONField(name: "s_active_icon")
	String sActiveIcon;
	@JSONField(name: "s_selected_icon")
	String sSelectedIcon;
}
