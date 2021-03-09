import 'package:Signs/generated/json/base/json_convert_content.dart';
import 'package:Signs/generated/json/base/json_field.dart';

class BannersResponseEntity with JsonConvert<BannersResponseEntity> {
	int code;
	String status;
	List<Banners> data;
}

class Banners with JsonConvert<Banners> {
	@JSONField(name: "b_id")
	String bId;
	@JSONField(name: "b_from_date")
	String bFromDate;
	@JSONField(name: "b_from_time")
	String bFromTime;
	@JSONField(name: "b_to_date")
	String bToDate;
	@JSONField(name: "b_to_time")
	String bToTime;
	@JSONField(name: "b_show")
	String bShow;
	@JSONField(name: "b_image")
	String bImage;
}
