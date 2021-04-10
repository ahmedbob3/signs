import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/details/appointment_details_screen.dart';
import 'package:Signs/ui/appointment/list/widget/Icon&textRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:Signs/data/remote/appointment/models/appointment_response_entity.dart';
import 'package:Signs/Utils/extensions/strings_extensions.dart';
Widget appointmentContainer(AppointmentResponseData appointment){
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
                      appointment.dImage,
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
                      appointment.dName,
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
                      appointment.sName,
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
                appointment.hName,
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
                '${appointment.dsDate.formatDate(sourceDateFormat: 'yyyy-mm-dd', destinationFormat: 'dd MMM')} , ${appointment.dsTime.formatDate(sourceDateFormat: 'hh:mm:ss', destinationFormat: 'hh:mm a')}',
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