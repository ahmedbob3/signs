import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/ui/appointment/list/appointment_list_controller.dart';
import 'package:Signs/ui/appointment/list/widget/bottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Signs/ui/appointment/list/widget/appointmentContainer.dart';

class AppointmentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentListController>(
      init: AppointmentListController(),
      builder: (controller) {
        return Container(
          height: 1.sh,
          child: Stack(
            children: [
              Container(
                width: 1.sw,
                height: 0.25.sh,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Appointment_BG,
                      ),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Appointments',
                          style: heavyWhiteTextStyle,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Image(
                          image: AssetImage(SearchIcon,),
                          fit: BoxFit.fill,
                        ),
                        Image(
                          image: AssetImage(Medicine_notification,),
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: defaultSecondaryBackgroundColor,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: Text(
                            'NA',
                            style: appTheme.textTheme.button,
                          ),
                        ),
                        Text(
                          'Nina\'s Appointments',
                          style: whiteSmokeStyle,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        GestureDetector(
                          onTap: (){
                            bottomSheet();
                          },
                          child: Text(
                            'Change',
                            style: changeTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(
                    horizontal: 0.05.sw,
                  ),
                  height: 0.77.sh,
                  width: 0.9.sw,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => appointmentContainer(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
