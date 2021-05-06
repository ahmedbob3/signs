import 'package:Signs/Screens/landing_screen.dart';
import 'package:Signs/ui/appointment/details/appointment_details_screen.dart';
import 'package:Signs/ui/appointment/doctors/details/doctor_details_screen.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/confirmation_success/confirmation_success_screen.dart';
import 'package:Signs/ui/appointment/doctors/details/widgets/image_details.dart';
import 'package:Signs/ui/appointment/doctors/list/doctors_screen.dart';
import 'package:Signs/ui/appointment/speciality/specialty_screen.dart';
import 'package:Signs/ui/appointment/hospital/details/hospital_details_screen.dart';
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
  GetPage(
    name: ConfirmationSuccessScreen.tag,
    page: () => ConfirmationSuccessScreen(),
    transitionDuration: Duration(milliseconds: 0)
  ),
  GetPage(
    name: AppointmentDetailsScreen.tag,
    page: () => AppointmentDetailsScreen(),
    transitionDuration: Duration(milliseconds: 0)
  ),
  GetPage(
    name: ImageDetails.tag,
    page: () => ImageDetails(),
    transitionDuration: Duration(milliseconds: 0)
  ),
  GetPage(
    name: LandingScreen.tag,
    page: () => LandingScreen(),
    transitionDuration: Duration(milliseconds: 0)
  ),
];