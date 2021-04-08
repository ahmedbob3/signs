import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/details/appointment_details_screen.dart';
import 'package:Signs/ui/appointment/list/widget/Icon&textRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

appointmentContainer(){
  return GestureDetector(
    onTap: (){
      Get.to(AppointmentDetailsScreen());
    },
    child: Container(
      height: 0.27.sh,
      margin: EdgeInsets.symmetric(vertical: 7.h),
      padding: EdgeInsets.symmetric(
          horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5.r,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 0.1.sh,
                width: 0.08.sh,
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
              SizedBox(width: 15.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.h,),
                    child: Text(
                      'Dr.Albert Alexander',
                      style: boldCobaltTextStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
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
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myCustomRow(
                'New Mowaset Hospital',
                'ic_mapMarker.png',
              ),
              myCustomRow(
                '1 hour',
                'ic_clock_2.png',
              ),
            ],
          ),
          Divider(
            color:MANATE,
            height: 35.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '30 July , 09:00 am',
                style: appTheme.textTheme.headline6,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(221, 231, 247, 1),
                  borderRadius: BorderRadius.circular(
                    5.r,
                  ),
                ),
                child: Text(
                  'Upcoming',
                  style: regularDeniumTextStyle,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}