import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/ui/appointment/hospital/details/hospital_details_controller.dart';
import 'package:Signs/ui/appointment/hospital/details/widgets/about_hospital.dart';
import 'package:Signs/ui/appointment/hospital/details/widgets/hospital_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:Signs/widgets/appbar.dart';

class HospitalDetailsScreen extends StatelessWidget {
  static const tag = "HospitalDetailsScreen";
  @override
  Widget build(BuildContext context) {
    Datum hospital = ModalRoute.of(context).settings.arguments;
    return GetBuilder<HospitalDetailsController>(
      init: HospitalDetailsController(hospital: hospital),
      builder: (controller){
        return Scaffold(
          appBar: getAppBar(
            title: '',
            actions: [
              // Image.asset(SearchIcon),
              IconButton(
                icon: Image.asset(ShareIcon),
                onPressed: () async {
                  await FlutterShare.share(
                      title: 'Hospital',
                      text: hospital.hName +
                          " \n " +
                          hospital.hLocation +
                          "\n" +
                          'http://maps.google.com/maps?q=${hospital.hLatlang.split(',')[0]},${hospital.hLatlang.split(',')[1]}');
                },
              ),
            ],
          ),
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          body: Column(
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
                              NetworkImage(hospital.hImage),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(hospital.hName,
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
                                  hospital.hLocation,
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
                if(controller.showTaps()) Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: FlutterToggleTab(
                    // width in percent, to set full width just set to 100
                    width: 65,
                    borderRadius: 10,
                    height: 50,
                    initialIndex: SERVICES_TAP,
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
                      controller.selectNewIndex(index);
                    },
                  ),
                ) else Expanded(child: AboutHospital(hospital: hospital,)),
                controller.showTaps()? Expanded(
                  child: (controller.selectedTabIndex == OVERVIEW_TAP) ?
                  AboutHospital(hospital: hospital,) : HospitalServices(hospital: hospital),
                ) :Container()
              ],
            )
        );
      },
    );
  }
}
