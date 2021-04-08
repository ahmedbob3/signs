import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

myCustomRow(String text,String icon){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(image: AssetImage('assets/images/$icon'),
        fit: BoxFit.fill,),
      SizedBox(width: 5.w,),
      Text(text,
        style:smallSemiGreyStyle,
      ),
    ],
  );
}