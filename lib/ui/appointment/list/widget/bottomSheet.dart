import 'package:Signs/Models/subaccounts_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bottomSheet(Function(Data) onSelect){
  List<Data> subAccountsList = Constants.subaccountsList;

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
        itemCount: subAccountsList.length,
        itemBuilder: (context,index){
          final Data account = subAccountsList[index];
          return Padding(
            padding: const EdgeInsets.only(top:8.0, bottom: 8),
            child: ListTile(
              leading: Container(
                height: 0.08.sh,
                width: 0.08.sh,
                margin:EdgeInsets.symmetric(horizontal: 0.05.sw,),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: darkMidNight
                ),
                child: Center(
                  child: Text(
                    '${account.saFirstName[0].capitalize}${account.saLastName[0].capitalize}',
                    style: appTheme.textTheme.button,
                  ),
                ),
              ),
              title: Text(account.saFirstName + ' ' + account.saLastName,style: heavyGreySemiBoldTextStyle,),
              trailing: account.isSelected?Icon(Icons.check_circle,color: Color.fromRGBO(6, 197, 222, 1),):SizedBox(),
              onTap: (){
                subAccountsList.forEach((element) {
                  element.isSelected = false;
                });
                account.isSelected = true;
                onSelect(account);
                Get.back();
              },
            ),
          );
        },
      ),
      
    ),
    barrierColor: Colors.black54,
    enterBottomSheetDuration: Duration(milliseconds: 500,),
  );
}