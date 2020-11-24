import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';

class HospitalDetailsScreen extends StatefulWidget {
  Datum hospitalItem;
  HospitalDetailsScreen(this.hospitalItem, {Key key}) : super(key: key);

  @override
  _HospitalDetailsScreenState createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Image.asset(SearchIcon),
          IconButton(
            icon: Image.asset(ShareIcon),
            onPressed: () async {
              await FlutterShare.share(
                title: 'Hospital',
                text: widget.hospitalItem.hAbout,
              );
            },
          ),
        ],
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: Image.asset(
                      Hospital_BG,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80),
                        CircleAvatar(
                          radius: 43,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            backgroundImage:
                                NetworkImage(widget.hospitalItem.hImage),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(widget.hospitalItem.hName,
                            style: titleStyle(
                                color: Colors.white,
                                fontFamily: boldFontFamily,
                                fontSize: 24)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              MapMarker,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(widget.hospitalItem.hLocation,
                                style: titleStyle(
                                    color: Color.fromRGBO(226, 232, 239, 1)))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: titleStyle(
                          color: defaultBackgroundColor,
                          fontFamily: boldFontFamily,
                          fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.hospitalItem.hAbout,
                      style: titleStyle(fontSize: 18, color: payneGray),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () async {
                              var latitude =
                                  widget.hospitalItem.hLatlang.split(',')[0];
                              var longitude =
                                  widget.hospitalItem.hLatlang.split(',')[1];
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
                                    'Get Direction',
                                    style: titleStyle(
                                        color: defaultBackgroundColor,
                                        fontFamily: mediumFontFamily),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () async {
                              await launch(
                                  "tel://${widget.hospitalItem.hPhone}");
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
                                    'Call',
                                    style: titleStyle(
                                        color: defaultBackgroundColor,
                                        fontFamily: mediumFontFamily),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
                      'Gallery',
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
                        itemCount: widget.hospitalItem.gallery.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.hospitalItem.gallery[index]),
                                      fit: BoxFit.cover)),
                            ),
                            onTap: () {
                              showDialog(
                                context: (context),
                                barrierDismissible: true,
                                builder: (context) {
                                  return CarouselSlider(
                                    items: widget.hospitalItem.gallery
                                        .map((item) => Container(
                                              child: Center(
                                                  child: Image.network(item,
                                                      fit: BoxFit.cover,
                                                      width: 1000)),
                                            ))
                                        .toList(),
                                    options: CarouselOptions(
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      viewportFraction: 0.8,
                                      aspectRatio: 2.0,
                                      enableInfiniteScroll: false,
                                      initialPage: 0,
                                    ),
                                  );
                                },
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
        ),
      ),
    );
  }
}
