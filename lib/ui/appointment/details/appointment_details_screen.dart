import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/models/appointment_response_entity.dart';
import 'package:Signs/ui/appointment/details/appointment_details_controller.dart';
import 'package:Signs/ui/appointment/details/widget/rate-bottom-sheet.dart';
import 'package:Signs/ui/appointment/list/widget/appointmentContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Signs/ui/appointment/details/widget/customContainer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Signs/Utils/extensions/strings_extensions.dart';


class AppointmentDetailsScreen extends StatelessWidget {
  static const tag = "AppointmentDetailsScreen";
  @override
  Widget build(BuildContext context) {
    AppointmentResponseData appointment = Get.arguments;
    return GetBuilder<AppointmentDetailsController>(
        init: AppointmentDetailsController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: 0.95.sh,
                  width: 1.sw,
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Image(
                          image: AssetImage(
                            Arrow_back_grey,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Appointment Details',
                        style: heavyCobaltTextStyle,
                      ),
                      SizedBox(height: 12,),
                      Container(
                        height: 0.22.sh,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 0.18.sh,
                              width: 0.12.sh,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    appointment.dImage,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    appointment.dName,
                                    style: boldCobaltTextStyle,
                                  ),
                                  Text(
                                    appointment.dTitle,
                                    style: dimGreySemiBold16TextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right:8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 0.04.sh,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 237, 190, 1),
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                        border: Border.all(
                                          color: amber,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        appointment.sName,
                                        style: specialistTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        height: 0.25.sh,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        appointment.hName,
                                        style: appTheme.textTheme.headline6,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            icon: Image(
                                              image: AssetImage(MapMarker),
                                              fit: BoxFit.fill,
                                            ),
                                            onPressed: () async{
                                              var latitude =
                                              appointment.hLatlang.split(',')[0];
                                              var longitude =
                                              appointment.hLatlang.split(',')[1];
                                              String googleUrl =
                                                  'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
                                              if (await canLaunch(googleUrl)) {
                                              await launch(googleUrl);
                                              } else {
                                              throw 'Could not open the map.';
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              appointment.hLocation,
                                              style: payneGreyStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            appointment.dsDate.formatDate(sourceDateFormat: 'yyyy-mm-dd', destinationFormat: 'dd MMM yyyy'),
                                            style: regularTealTextStyle,
                                          ),
                                          Text(
                                            ' at ',
                                            style: dimGreySemiBold16TextStyle,
                                          ),
                                          Text(
                                            appointment.dsTime.formatDate(sourceDateFormat: 'hh:mm:ss', destinationFormat: 'hh:mm a'),
                                            style: regularTealTextStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(7.w),
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(33, 99, 206, 0.15),
                                          borderRadius: BorderRadius.circular(
                                            5.r,
                                          ),
                                        ),
                                        child: Image(
                                          image: AssetImage(DirectionIcon),
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 10.h),
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                        ),
                                        decoration: checkIfPastAppointment(appointment.dsDate, appointment.dsTime)?pastBoxDecoration:upcomingBoxDecoration,
                                        child: Text(
                                          checkIfPastAppointment(appointment.dsDate, appointment.dsTime)?'Past':'Upcoming',
                                          style: checkIfPastAppointment(appointment.dsDate, appointment.dsTime)?battleShipTextStyle:regularDeniumTextStyle,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: MANATE,
                              height: 35.h,
                            ),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: [
//                                Container(
//                                  height: 0.05.sh,
//                                  width: 0.33.sw,
//                                  alignment: Alignment.center,
//                                  decoration: BoxDecoration(
//                                    color: MEDIUM_TEAL_BLUE,
//                                    borderRadius: BorderRadius.circular(
//                                      10.r,
//                                    ),
//                                  ),
//                                  child: Text('Reschedule',style:appTheme.textTheme.button,),
//                                ),
//                                Container(
//                                  height: 0.05.sh,
//                                  width: 0.33.sw,
//                                  alignment: Alignment.center,
//                                  decoration: BoxDecoration(
//                                    color: Colors.white,
//                                    borderRadius: BorderRadius.circular(
//                                      10.r,
//                                    ),
//                                    border: Border.all(
//                                      color: MANATE,
//                                      width: 1.sp,
//                                    )
//                                  ),
//                                  child: Text('Cancel',style:cancelTextStyle,),
//                                ),
//                              ],
//                            ),
                              //if appointment done
                            if(checkIfPastAppointment(appointment.dsDate, appointment.dsTime)) GestureDetector(
                              onTap: (){
                                rateBottomSheet(appointment);
                              },
                              child: Container(
                                height: 0.05.sh,
                                width: 0.65.sw,
                                decoration: BoxDecoration(
                                  color:MEDIUM_TEAL_BLUE,
                                  borderRadius: BorderRadius.circular(10.r,),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(image: AssetImage(RATE_ORDER,),fit: BoxFit.fill,),
                                    Text('Rate Appointment',style:appTheme.textTheme.button ,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      customContainer('Offline Appointment ', 'Type', DURATION),
                  //todo will be added later
                  /*customContainer(
                          '1 Hour ', '09:00 am - 10:00 am', DURATION),
                      customContainer('20 KD', 'For a Visit', FEES),*/
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
