import 'package:Signs/ui/appointment/doctors/details/doctor_details_screen.dart';
import 'package:Signs/ui/appointment/doctors/list/doctors_screen.dart';
import 'package:Signs/ui/appointment/speciality/specialty_screen.dart';
import 'package:Signs/ui/hospital/details/hospital_details_screen.dart';
import 'package:get/get.dart';

List<GetPage> applicationPages = [
  GetPage(
    name: SpecialityScreen.tag,
    page: () => SpecialityScreen(),
    transitionDuration: Duration(milliseconds: 0)
  ),
  GetPage(
    name: HospitalDetailsScreen.tag,
    page: () => HospitalDetailsScreen(),
    transitionDuration: Duration(milliseconds: 0)
  ),
  GetPage(
    name: DoctorsScreen.tag,
    page: () => DoctorsScreen(),
    transitionDuration: Duration(milliseconds: 0)
  ),
  GetPage(
    name: DoctorsDetailsScreen.tag,
    page: () => DoctorsDetailsScreen(),
    transitionDuration: Duration(milliseconds: 0)
  ),
];