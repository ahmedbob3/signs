import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/ui/appointment/doctors/details/doctor_details_controller.dart';
import 'package:Signs/ui/appointment/doctors/widgets/doctor_card.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:Signs/widgets/appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_url_preview/simple_url_preview.dart';

class DoctorsDetailsScreen extends StatelessWidget {
  static const tag = "DoctorsDetailsScreen";
  @override
  Widget build(BuildContext context) {
    final Doctor doctor = Get.arguments;
    return GetBuilder<DoctorDetailsController>(
      init: DoctorDetailsController(doctor),
      builder: (controller){
        return Scaffold(
          appBar: getAppBar(title: ''),
          backgroundColor: LIGHT_WHITE_COLOR,
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: HEADER_HEIGHT,
                    width: double.infinity,
                    color: MEDIUM_TEAL_BLUE,
                  ),
                  Expanded(
                    child: controller.isLoading? Center(child: CircularProgressIndicator()):
                    ListView(
                      padding: EdgeInsets.only(top:HEADER_HEIGHT/2, right: 16, left: 16),
                      children: [
                        Row(
                          children: [
                            Image.asset(IC_EXPERIENCE, width: 40, height: 40,),
                            SizedBox(width: 12,),
                            Text(controller.doctorDetails.dExperienceYear.toString(), style: boldDeniumTextStyle,),
                            SizedBox(width: 12,),
                            Text('Years of experience', style: dimGreySemiBoldTextStyle,)
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text(controller.doctorDetails.description),
                        SizedBox(height: 8,),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.doctorDetails.achievements.length,
                            itemBuilder: (buildContext, index){
                              String imageUrl = controller.doctorDetails.achievements[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 72,
                                  height: 74,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                        SizedBox(height: 12,),
                        if(controller.doctorDetails.videos.isNotEmpty) ...[
                          Text('Videos', style: Theme.of(context).textTheme.subtitle1,),
                          SizedBox(height: 20,),
                          Container(
                            height: 140,
                            width: double.infinity,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 200,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                // reverse: Constants.textDirection == TextDirection.rtl ,
                                viewportFraction: 0.8,
                                pageSnapping: true,
                                enableInfiniteScroll: false,
                                initialPage: 0,
                              ),
                              items: controller.doctorDetails.videos.map(
                                      (videoUrl) => Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SimpleUrlPreview(
                                      previewHeight: 130,
                                      url: videoUrl.replaceAll("http://thesignsco.com/", ''),
                                      bgColor: Colors.white,
                                      imageLoaderColor: Colors.blueGrey,
                                      titleLines: 1,
                                      descriptionLines: 2,
                                      titleStyle: boldBlack14TextStyle,
                                      descriptionStyle: Theme.of(context).textTheme.bodyText2,
                                    ),
                                  )).toList(),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],

                        if(controller.doctorDetails.articles.isNotEmpty) ...[
                          Text('Articles', style: Theme.of(context).textTheme.subtitle1,),
                          SizedBox(height: 20,),
                          ...controller.doctorDetails.articles.map(
                                  (articleUrl) => SimpleUrlPreview(
                                  url: articleUrl.replaceAll("http://thesignsco.com/", ''),
                                  bgColor: Colors.white,
                                  imageLoaderColor: Colors.blueGrey,
                                  titleLines: 1,
                                  descriptionLines: 2,
                                  titleStyle: boldBlack14TextStyle,
                                  descriptionStyle: Theme.of(context).textTheme.bodyText2
                              )
                          ),
                          SizedBox(height: 80,)
                        ]
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: HEADER_HEIGHT/2,),
                    DoctorCard(doctor: doctor,)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedButton(
                    btnName: "Make appointment",
                    onPressed: (){},
                    controller: AnimatedButtonController(),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
const double HEADER_HEIGHT = 180;