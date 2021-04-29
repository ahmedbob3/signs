import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class AppointmentResponseEntity with JsonConvert<AppointmentResponseEntity> {
	int code;
	String status;
	List<AppointmentResponseData> data;
}

class AppointmentResponseData with JsonConvert<AppointmentResponseData> {
	@JSONField(name: "a_id")
	String aId;
	@JSONField(name: "a_status")
	String aStatus;
	@JSONField(name: "ds_type")
	String dsType;
	@JSONField(name: "ds_date")
	String dsDate;
	@JSONField(name: "ds_time")
	String dsTime;
	@JSONField(name: "d_name")
	String dName;
	@JSONField(name: "d_title")
	String dTitle;
	@JSONField(name: "s_name")
	String sName;
	@JSONField(name: "h_location")
	String hLocation;
	@JSONField(name: "h_name")
	String hName;
	@JSONField(name: "h_latlang")
	String hLatlang;
	@JSONField(name: "d_image")
	String dImage;
}
