import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:Signs/ui/settings/widget/contact_us_bottom_sheet.dart';
import 'package:Signs/ui/settings/widget/language_bottomsheet.dart';
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
          onSelect: (){
            Get.bottomSheet(
              ContactUsBottomSheet(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
              ),
              barrierColor: Colors.black54,
              backgroundColor: Colors.white,
              enterBottomSheetDuration: Duration(milliseconds: 500,),
            );
          },
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
              LanguageBottomSheet(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
              ),
              barrierColor: Colors.black54,
              backgroundColor: Colors.white,
              enterBottomSheetDuration: Duration(milliseconds: 500,),
            );
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
