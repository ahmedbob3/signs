import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bottomSheet(){
  return Get.bottomSheet(
    Container(
      height: 0.4.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r,),
          topRight: Radius.circular(30.r,),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context,index)=>Container(
          margin:EdgeInsets.symmetric(horizontal: 0.03.sw,),
          height: 0.1.sh,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 0.08.sh,
                width: 0.08.sh,
                margin:EdgeInsets.symmetric(horizontal: 0.05.sw,),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://en.amerikanki.com/wp-content/uploads/2013/01/8-Ways-to-Be-a-Sincere-Person.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(child: Text('Henrietta Neal',style: heavyGreySemiBoldTextStyle,),),
              SizedBox(width: 0.2.sw,),
              index==2?Icon(Icons.check_circle,color: Color.fromRGBO(6, 197, 222, 1),):SizedBox(),
            ],
          ),
        ),
      ),
    ),
    barrierColor: Colors.black54,
    enterBottomSheetDuration: Duration(milliseconds: 500,),
  );
}