import 'package:Signs/Models/subaccounts_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Signs/generated/l10n.dart';

bottomSheet(Function(Data, bool isMainAccount) onSelect){
  List<Data> subAccountsList = Constants.subaccountsList;
  final mainAccount = Singleton().loginModel.data;

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
        itemCount: subAccountsList.length + 1,
        itemBuilder: (context,index){
          // display main account in index 0
          if(index == 0){
            return displayUserRow(
                firstName: mainAccount.uFirstName,
                lastName: mainAccount.uLastName,
                isSelected: mainAccount.isSelected,
                onTap: (){
                  subAccountsList.forEach((element) {
                    element.isSelected = false;
                  });
                  mainAccount.isSelected = true;
                  onSelect(null, true);
                  Get.back();
                }
            );
          }
          final Data account = subAccountsList[index - 1];
          return displayUserRow(
              firstName: account.saFirstName,
              lastName: account.saLastName,
              isSelected: account.isSelected,
              onTap: (){
                subAccountsList.forEach((element) {
                  element.isSelected = false;
                });
                mainAccount.isSelected = false;
                account.isSelected = true;
                onSelect(account, false);
                Get.back();
              }
          );
        },
      ),
      
    ),
    barrierColor: Colors.black54,
    enterBottomSheetDuration: Duration(milliseconds: 500,),
  );
}

Widget displayUserRow({@required String firstName, @required String lastName, @required bool isSelected, @required Function onTap}){
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
            '${firstName[0].capitalize}${lastName[0].capitalize}',
            style: appTheme.textTheme.button,
          ),
        ),
      ),
      title: Text(firstName + ' ' + lastName,style: heavyGreySemiBoldTextStyle,),
      trailing: isSelected?Icon(Icons.check_circle,color: Color.fromRGBO(6, 197, 222, 1),):SizedBox(),
      onTap: onTap,
    ),
  );
}