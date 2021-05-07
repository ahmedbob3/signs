import 'package:Signs/Screens/check_mobile_screen.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/services/shared_preferences_service.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:Signs/ui/settings/update_password/update_password_screen.dart';
import 'package:Signs/ui/settings/widget/contact_us_bottom_sheet.dart';
import 'package:Signs/ui/settings/widget/language_bottomsheet.dart';
import 'package:Signs/ui/settings/widget/settings_card.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(S.of(context).settings, style: tealBlueBold18Style, textAlign: TextAlign.center,),
          SizedBox(height: 24,),
          SettingsCard(
            cardName: S.of(context).aboutUS,
            cardIconPath: IC_SETTINGS_ABOUT_US,
            onSelect: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => WebviewScaffold(
                        url: 'https://en.wikipedia.org/wiki/About_us',
                        appBar: AppBar(
                          title: Text(S.of(context).aboutUS),
                        ),
                      )
                  )
              );
            },
          ),
          SizedBox(height: 8,),
          SettingsCard(
            cardName: S.of(context).changePassword,
            cardIconPath: IC_SETTINGS_CHANGE_PASSWORD,
            onSelect: (){
              Get.toNamed(UpdatePasswordScreen.tag);
            },
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
            onSelect: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => WebviewScaffold(
                        url: 'https://en.wikipedia.org/wiki/Special:Search?search=privacyPolicy&ns0=1',
                        appBar: AppBar(
                          title: Text(S.of(context).privacyPolicy),
                        ),
                      )
                  )
              );
            },
          ),
          SizedBox(height: 8,),
          SettingsCard(
            cardName: S.of(context).termsConditions,
            cardIconPath: IC_SETTINGS_TERMS,
            onSelect: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => WebviewScaffold(
                        url: 'https://en.wikipedia.org/wiki/Contractual_term',
                        appBar: AppBar(
                          title: Text(S.of(context).termsConditions),
                        ),
                      )
                  )
              );
            },
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
            onSelect: (){
              Get.dialog(
                SimpleDialog(
                  title: Text(S.of(context).logoutMsg, style: boldRifleTextStyle, textAlign: TextAlign.center,),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                  children: [
                    Image.asset(IC_LOGOUT, width: Get.width/2, height: Get.width/2,),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedButton(
                        btnName: S.of(context).logout,
                        controller: AnimatedButtonController(),
                        onPressed: (){
                          Get.find<SharedPreferencesService>().mobileNumber = '';
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CheckMobileScreen(isSignIn: false)
                              )
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextButton(
                        onPressed: (){
                          Get.back();
                        },
                        child: Text(S.of(context).later)
                    )
                  ],
                )

              );
            },
          ),
          SizedBox(height: 8,),

        ],
      ),
    );
  }
}
