import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/utils.dart';
import 'package:Signs/ui/appointment/doctors/list/doctors_screen.dart';
import 'package:Signs/ui/appointment/hospital/details/hospital_details_controller.dart';
import 'package:Signs/ui/appointment/hospital/details/widgets/service.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalServices extends StatelessWidget {
  final Datum hospital;
  final CarouselController buttonCarouselController = CarouselController();
  HospitalServices({Key key, this.hospital}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HospitalDetailsController controller = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.isBannerLoading? Container(height:160,child: Center(child: CircularProgressIndicator())):
            controller.hospitalBanners.isNotEmpty? CarouselSlider(
              carouselController:
              buttonCarouselController, items: controller.hospitalBanners
                .map((item) => Container(
              child: Center(
                  child: Image.network(
                      item.bImage,
                      fit: BoxFit
                          .cover,
                      width: 1000)),
            ))
                .toList(),
              options: CarouselOptions(
                height: 160,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlay: false,
                enlargeCenterPage: true,
                reverse: Constants.textDirection == TextDirection.rtl ,
                viewportFraction: 0.9,
                enableInfiniteScroll: true,
                initialPage: 0,

              ),
            ):Container(),
            SizedBox(height: 26,),
            Text(
              "What are you looking for ?",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 26,),
            if(hospital.hasPhysicalAppointment == 1)
              ...[
                Service(
                  assetPath: PHYSICAL_APPOINTMENT,
                  serviceName: "Physical Appointment",
                  serviceDescription: "Book an appointment with a doctor in required specialty",
                  onClick: (){
                    Get.toNamed(DoctorsScreen.tag, arguments: ModalRoute.of(context).settings.arguments);
                  },
                ),
                SizedBox(height: 16,),
              ],
            if(hospital.hasOnlineAppointment == 1)
              ...[
                Service(
                  assetPath: ONLINE_APPOINTMENT,
                  serviceName: "Online Appointment",
                  serviceDescription: "Book online an appointment with a doctor in required specialty",
                  onClick: (){
                    showComingSoonMessage();
                  },
                ),
                SizedBox(height: 16,),
              ],
            if(hospital.hasMedicalHistory == 1)
              ...[
                Service(
                  assetPath: MEDICAL_HISTORY,
                  serviceName: "Medical History",
                  serviceDescription: "You can Request your medical history from the hospital in required specialty",
                ),
                SizedBox(height: 16,)
              ],
            if(hospital.hasEmergencyCall == 1)
              ...[
                Service(
                  assetPath: EMERGENCY_CALL,
                  serviceName: "Emergency call",
                  serviceDescription: "You can make a Emergency call",
                ),
                SizedBox(height: 26,)
              ],
            /*
            todo show this section after completing the appointment cycle
            Text(
              "You recently visit",
              style: Theme.of(context).textTheme.headline6,
            ),*/
            SizedBox(height: 26,),
          ],
        ),
      ),
    );
  }
}
