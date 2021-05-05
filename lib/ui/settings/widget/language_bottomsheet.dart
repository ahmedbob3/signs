import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/services/localization_service.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16,),
        Text(S.of(context).changeLanguage, textAlign: TextAlign.center, style: boldBlack16TextStyle,),
        SizedBox(height: 16,),
        ListTile(
          leading: Image.asset(IC_LANGUAGE_ENGLISH, width: 50, height: 50,),
          title: Text("English", style: heavyGreySemiBoldTextStyle,),
          trailing: Constants.languageId == languages.English? Icon(Icons.done, color: MEDIUM_TEAL_BLUE,):Container(height: 5, width: 5,),
          onTap: (){
            Get.back();
            Future.delayed(Duration(seconds: 0), (){
              Constants.languageId = languages.English;
              Constants.textDirection = TextDirection.ltr;
              Get.find<LocalizationService>().updateLocale(AppLocale.english);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(height: 1, color: platinum,),
        ),
        ListTile(
          leading: Image.asset(IC_LANGUAGE_ARABIC, width: 50, height: 50,),
          title: Text("عربي", style: heavyGreySemiBoldTextStyle,),
          trailing: Constants.languageId == languages.Arabic ? Icon(Icons.done, color: MEDIUM_TEAL_BLUE,):Container(height: 5, width: 5,),
          onTap: (){
            Get.back();
            Future.delayed(Duration(seconds: 0), (){
              Constants.languageId = languages.Arabic;
              Constants.textDirection = TextDirection.rtl;
              Get.find<LocalizationService>().updateLocale(AppLocale.arabic);
            });
          },
        ),
      ],
    );
  }
}
