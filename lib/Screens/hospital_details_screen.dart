import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/ui/appointment/speciality/specialty_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class HospitalDetailsScreen extends StatefulWidget {
  Datum hospitalItem;
  HospitalDetailsScreen(this.hospitalItem, {Key key}) : super(key: key);

  @override
  _HospitalDetailsScreenState createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Constants.textDirection,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            // Image.asset(SearchIcon),
            IconButton(
              icon: Image.asset(ShareIcon),
              onPressed: () async {
                await FlutterShare.share(
                    title: 'Hospital',
                    text: widget.hospitalItem.hName +
                        " \n " +
                        widget.hospitalItem.hLocation +
                        "\n" +
                        'http://maps.google.com/maps?q=${widget.hospitalItem.hLatlang.split(',')[0]},${widget.hospitalItem.hLatlang.split(',')[1]}');
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
                      height: 260,
                      child: Image.asset(
                        Hospital_BG,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 40),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                MapMarker,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 260,
                                child: Text(
                                  widget.hospitalItem.hLocation,
                                  style: titleStyle(
                                    color: Color.fromRGBO(226, 232, 239, 1),
                                  ),
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                 child: FlutterToggleTab(
                    // width in percent, to set full width just set to 100
                    width: 65,
                    borderRadius: 10,
                    height: 50,
                    initialIndex: 0,
                    selectedBackgroundColors: [defaultBackgroundColor],
                    unSelectedBackgroundColors: [backTabColor],
                    selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: mediumFontFamily),
                    unSelectedTextStyle: TextStyle(
                        color: greyColor,
                        fontSize: 15,
                        fontFamily: mediumFontFamily),
                    labels: [Strings().getOverviewText(),Strings().getServiceText()],
                    selectedLabelIndex: (index) {
                      setState(() {
                        currentIndex=index;
                        // print("Selected Index $index");
                      });
                    },
                  ),
                ),
            currentIndex==0 ?
        Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings().getAboutLabel(),
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
                              MaterialButton(
                                padding: EdgeInsets.zero,
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
                                    itemCount: widget.hospitalItem.gallery.length,
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
                                                  image: NetworkImage(widget
                                                      .hospitalItem
                                                      .gallery[index]),
                                                  fit: BoxFit.cover)),
                                        ),
                                        onTap: () {
                                          showDialog(
                                              context: (context),
                                              barrierDismissible: true,
                                              builder: (ctx){
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: CarouselSlider(
                                                    carouselController:
                                                    buttonCarouselController,
                                                    items: widget
                                                        .hospitalItem.gallery
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
                                                );
                                              }
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
                ):Container(

                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SpecialityScreen.tag);
                  },
                  child: CarouselSlider(
                    carouselController:
                    buttonCarouselController, items: widget.hospitalItem.gallery
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
                      height: 200,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      reverse: Constants.textDirection == TextDirection.rtl ,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: true,
                      initialPage: 0,

                    ),
                  ),
                )
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
