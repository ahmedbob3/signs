import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class DoctorsEntity with JsonConvert<DoctorsEntity> {
	int code;
	String status;
	List<Doctor> data = [];
}

class Doctor with JsonConvert<Doctor> {
	@JSONField(name: "d_id")
	String id;
	@JSONField(name: "d_name")
	String name;
	@JSONField(name: "s_name")
	String speciality;
	@JSONField(name: "d_title")
	String bio;
	@JSONField(name: "d_image")
	String imageUrl;
}
