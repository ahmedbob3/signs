import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

customContainer(String title,String subTitle,String icon){
  return  Container(
    height: 0.1.sh,
    padding: EdgeInsets.symmetric(horizontal: 20.w,),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r,),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: appTheme.textTheme.subtitle1,),
            Text(subTitle,style: smallSemiGreyStyle,),
          ],
        ),
        Image(image: AssetImage(icon),),
      ],
    ),
  );
}
