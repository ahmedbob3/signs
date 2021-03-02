import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutHospital extends StatelessWidget {
  final Datum hospital;
  final CarouselController buttonCarouselController = CarouselController();
  AboutHospital({Key key, this.hospital}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:18.0, right: 18),
                  child: Text(
                    Strings().getAboutLabel(),
                    style: titleStyle(
                        color: defaultBackgroundColor,
                        fontFamily: boldFontFamily,
                        fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                padding: const EdgeInsets.only(left:18.0, right: 18),
                  child: Text(
                    hospital.hAbout,
                    style: titleStyle(fontSize: 18, color: payneGray),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                padding: const EdgeInsets.only(left:18.0, right: 18),
                  child: Row(
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          var latitude =
                          hospital.hLatlang.split(',')[0];
                          var longitude =
                          hospital.hLatlang.split(',')[1];
                          String googleUrl =
                              'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
                          if (await canLaunch(googleUrl)) {
                            await launch(googleUrl);
                          } else {
                            throw 'Could not open the map.';
                          }
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(33, 99, 206, 0.15),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(DirectionIcon),
                              SizedBox(width: 10),
                              Text(
                                Strings().getDirectionsLabel(),
                                style: titleStyle(
                                    color: defaultBackgroundColor,
                                    fontFamily: mediumFontFamily),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await launch(
                              "tel://${hospital.hPhone}");
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(33, 99, 206, 0.15),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(CallIcon),
                              SizedBox(width: 10),
                              Text(
                                Strings().getCallLabel(),
                                style: titleStyle(
                                    color: defaultBackgroundColor,
                                    fontFamily: mediumFontFamily),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  color: Color.fromRGBO(163, 172, 194, 0.15),
                  thickness: 5,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings().getGalleryLabel(),
                        style: titleStyle(
                            color: defaultBackgroundColor,
                            fontFamily: boldFontFamily,
                            fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 120,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hospital.gallery.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Container(
                                margin: EdgeInsets.all(5),
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(hospital
                                            .gallery[index]),
                                        fit: BoxFit.cover)),
                              ),
                              onTap: () {
                                showDialog(
                                    context: (context),
                                    barrierDismissible: true,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: CarouselSlider(
                                        carouselController:
                                        buttonCarouselController,
                                        items: hospital.gallery
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
                                          autoPlay: false,
                                          enlargeCenterPage: true,
                                          reverse: Constants.textDirection == TextDirection.rtl ,
                                          // viewportFraction: 0.8,
                                          // aspectRatio: 2.0,
                                          enableInfiniteScroll: false,
                                          initialPage: 0,
                                        ),
                                      ),
                                    )
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
