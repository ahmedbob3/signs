import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

rateBottomSheet(){
  return Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        height: 0.7.sh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r,),
            topRight: Radius.circular(30.r,),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical:15.h,),
              child: Text('Rate Appointment',style:boldCobaltTextStyle ,),
            ),
            rateContainer('Dr.Albert Alexander','https://image.freepik.com/free-vector/doctor-character-background_1270-84.jpg'),
            rateContainer('New Mowasat Hospital',''),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                height: 0.07.sh,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal:20.w,vertical: 15.h),
                decoration: BoxDecoration(
                  color:MEDIUM_TEAL_BLUE,
                  borderRadius: BorderRadius.circular(10.r,),
                ),
                child: Text('Rate ',style:appTheme.textTheme.button ,),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierColor: Colors.black54,
    isScrollControlled: true,
    enterBottomSheetDuration: Duration(milliseconds: 500,),
  );
}

rateContainer(String name,String doctorImage){
  return Container(
    height: 0.24.sh,
    margin:EdgeInsets.symmetric(horizontal:20.w,vertical: 5.h,),
    padding:EdgeInsets.symmetric(vertical:10.h,),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r,),
        boxShadow: [
          BoxShadow(
            color:shadowColor,
            offset: Offset(0,2,),
            blurRadius: 11,
            spreadRadius: 0,
          ),
        ]
    ),
    child: Column(
      children: [
        Row(
          children: [
            doctorImage==''?
            SizedBox():
            Container(
              height: 0.12.sh,
              width: 0.1.sh,
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.r,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    doctorImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: boldBlack16TextStyle,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 0.06.sh,
                    width: 0.5.sw,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image:AssetImage(STAR_ACTIVE,),fit: BoxFit.fill,),
                        Image(image:AssetImage(STAR_ACTIVE,),),
                        Image(image:AssetImage(STAR_ACTIVE,),),
                        Image(image:AssetImage(STAR_ACTIVE,),),
                        Image(image:AssetImage(STAR_ACTIVE,),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h,),
          child: TextField(
            decoration: InputDecoration(
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r,),
                borderSide: BorderSide(
                    color: borderColor,
                    width: 0.6
                ),
              ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r,),
                borderSide: BorderSide(
                    color: borderColor,
                    width: 0.6
                ),
              ),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r,),
                borderSide: BorderSide(
                    color: borderColor,
                    width: 0.6
                ),
              ),
              hintText: 'Give us your feedback',
              hintStyle:regularGreyTextStyle,
            ),
          ),
        ),
      ],
    ),
  );
}
