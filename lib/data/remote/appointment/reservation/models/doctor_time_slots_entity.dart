import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class DoctorTimeSlotsEntity with JsonConvert<DoctorTimeSlotsEntity> {
	int code;
	String status;
	List<DoctorTimeSlot> data;
}

class DoctorTimeSlot with JsonConvert<DoctorTimeSlot> {
	@JSONField(name: "ds_id")
	String dsId;
	@JSONField(name: "ds_d_id")
	String dsDId;
	@JSONField(name: "ds_type")
	String dsType;
	@JSONField(name: "ds_date")
	String dsDate;
	@JSONField(name: "ds_time")
	String dsTime;
	@JSONField(name: "ds_avaliable")
	String dsAvaliable;
}
