import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/ui/appointment/doctors/doctors_screen.dart';
import 'package:Signs/ui/hospital/details/widgets/service.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              carouselController:
              buttonCarouselController, items: hospital.gallery
                .map((item) => Container(
              child: Center(
                  child: Image.network(
                      item,
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
            ),
            SizedBox(height: 26,),
            Text(
              "What are you looking for ?",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 26,),
            Service(
              assetPath: PHYSICAL_APPOINTMENT,
              serviceName: "Physical Appointement",
              serviceDescription: "Book an appointement with a doctor in required specialty",
              onClick: (){
                Get.toNamed(DoctorsScreen.tag);
              },
            ),
            SizedBox(height: 16,),
            Service(
              assetPath: ONLINE_APPOINTMENT,
              serviceName: "Online Appointement",
              serviceDescription: "Book online an appointement with a doctor in required specialty",
            ),
            SizedBox(height: 16,),
            Service(
              assetPath: MEDICAL_HISTORY,
              serviceName: "Medical History",
              serviceDescription: "You can Request your medical history from the hospital in required specialty",
            ),
            SizedBox(height: 16,),
            Service(
              assetPath: EMERGENCY_CALL,
              serviceName: "Emergency call",
              serviceDescription: "You can make a Emergency call",
            ),
            SizedBox(height: 26,),
            Text(
              "You recently visit",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 26,),
          ],
        ),
      ),
    );
  }
}
