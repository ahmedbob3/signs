import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/details/appointment_details_controller.dart';
import 'package:Signs/ui/appointment/details/widget/rate-bottom-sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Signs/ui/appointment/details/widget/customContainer.dart';
class AppointmentDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image(
                        image: AssetImage(
                          Arrow_back_grey,
                        ),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Appointment Details',
                        style: heavyCobaltTextStyle,
                      ),
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
                                    'https://image.freepik.com/free-vector/doctor-character-background_1270-84.jpg',
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
                                    'Dr.Albert Alexander',
                                    style: boldCobaltTextStyle,
                                  ),
                                  Text(
                                    'Consultant & Clinical Director of Orthopedic Surgery',
                                    style: dimGreySemiBold16TextStyle,
                                  ),
                                  Container(
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
                                      'Orthopedic Specialist',
                                      style: specialistTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                        'New Moasat Hospital',
                                        style: appTheme.textTheme.headline6,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image(
                                            image: AssetImage(MapMarker),
                                            fit: BoxFit.fill,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            'Salem Al Mubarak St , Salmiya',
                                            style: payneGreyStyle,
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
                                            '30 July 2021',
                                            style: regularTealTextStyle,
                                          ),
                                          Text(
                                            ' at ',
                                            style: dimGreySemiBold16TextStyle,
                                          ),
                                          Text(
                                            '09:00 am',
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
                                      MainAxisAlignment.spaceEvenly,
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
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              130, 130, 130, 0.14),
                                          borderRadius: BorderRadius.circular(
                                            5.r,
                                          ),
                                        ),
                                        child: Text(
                                          'Past',
                                          style: battleShipTextStyle,
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
                            GestureDetector(
                              onTap: (){
                                rateBottomSheet();
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
                      customContainer('Offline Appointment ', 'Type', DURATION),
                      customContainer(
                          '1 Hour ', '09:00 am - 10:00 am', DURATION),
                      customContainer('20 KD', 'For a Visit', FEES),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
