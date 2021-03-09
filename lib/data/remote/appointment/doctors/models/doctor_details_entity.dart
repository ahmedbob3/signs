import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class DoctorDetailsEntity with JsonConvert<DoctorDetailsEntity> {
	int code;
	String status;
	List<DoctorDetails> data;
}

class DoctorDetails with JsonConvert<DoctorDetails> {
	@JSONField(name: "d_id")
	String id;
	@JSONField(name: "d_name")
	String name;
	@JSONField(name: "d_title")
	String bio;
	@JSONField(name: "d_about")
	String description;
	@JSONField(name: "s_name")
	String speciality;
	@JSONField(name: "d_experience_year")
	String dExperienceYear;
	@JSONField(name: "d_image")
	String dImage;
	@JSONField(name: "gallery")
	List<String> achievements;
	List<String> videos;
	List<String> articles;
}
