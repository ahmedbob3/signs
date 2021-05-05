import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:Signs/ui/settings/widget/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 16,),
        Text(S.of(context).settings, style: tealBlueBold18Style, textAlign: TextAlign.center,),
        SizedBox(height: 24,),
        SettingsCard(
          cardName: S.of(context).aboutUS,
          cardIconPath: IC_SETTINGS_ABOUT_US,
          onSelect: (){},
        ),
        SizedBox(height: 8,),
        SettingsCard(
          cardName: S.of(context).changePassword,
          cardIconPath: IC_SETTINGS_CHANGE_PASSWORD,
          onSelect: (){},
        ),
        SizedBox(height: 8,),
        SettingsCard(
          cardName: S.of(context).contactUs,
          cardIconPath: IC_SETTINGS_CONTACT_US,
          onSelect: (){},
        ),
        SizedBox(height: 8,),
        SettingsCard(
          cardName: S.of(context).privacyPolicy,
          cardIconPath: IC_SETTINGS_PRIVACY_POLICY,
          onSelect: (){},
        ),
        SizedBox(height: 8,),
        SettingsCard(
          cardName: S.of(context).termsConditions,
          cardIconPath: IC_SETTINGS_TERMS,
          onSelect: (){},
        ),
        SizedBox(height: 8,),
        SettingsCard(
          cardName: S.of(context).language,
          cardIconPath: IC_SETTINGS_LANGUAGE,
          onSelect: (){
            Get.bottomSheet(
              Column(
                children: [
                  Text(S.of(context).changeLanguage, textAlign: TextAlign.center, style: boldBlack16TextStyle,),
                  SizedBox(height: 16,),
                  ListTile(
                    leading: Image.asset(IC_LANGUAGE_ENGLISH, width: 50, height: 50,),
                    title: Text("English", style: heavyGreySemiBoldTextStyle,),
                    trailing: Constants.languageId == languages.English? Icon(Icons.done, color: MEDIUM_TEAL_BLUE,):Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(height: 1, color: platinum,),
                  ),
                  ListTile(
                    leading: Image.asset(IC_LANGUAGE_ARABIC, width: 50, height: 50,),
                    title: Text("عربي", style: heavyGreySemiBoldTextStyle,),
                    trailing: Constants.languageId == languages.Arabic ? Icon(Icons.done, color: MEDIUM_TEAL_BLUE,):Container(),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              barrierColor: Colors.black54,
              enterBottomSheetDuration: Duration(milliseconds: 500,),);
          },
        ),
        SizedBox(height: 8,),
        SettingsCard(
          cardName: S.of(context).logout,
          cardIconPath: IC_SETTINGS_LOG_OUT,
          onSelect: (){},
        ),
        SizedBox(height: 8,),

      ],
    );
  }
}
