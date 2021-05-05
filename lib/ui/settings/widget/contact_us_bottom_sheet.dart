import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16,),
        Text(S.of(context).contactUs, textAlign: TextAlign.center, style: boldBlack16TextStyle,),
        SizedBox(height: 16,),
        ListTile(
          leading: Image.asset(IC_EMAIL, width: 50, height: 50,),
          title: Text(S.of(context).emailUs, style: heavyGreySemiBoldTextStyle,),
          onTap: () async{
            Get.back();
            final Uri _emailLaunchUri = Uri(
              scheme: 'mailto',
              path: CONTACT_US_EMAIL,
            );
            await launch(_emailLaunchUri.toString());
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(height: 1, color: platinum,),
        ),
        ListTile(
          leading: Image.asset(IC_CALL, width: 50, height: 50,),
          title: Text(S.of(context).callUs, style: heavyGreySemiBoldTextStyle,),
          onTap: () async{
            Get.back();
            await launch("tel://$CONTACT_US_PHONE");
          },
        ),
      ],
    );
  }
}

const CONTACT_US_PHONE = '01280291398';
const CONTACT_US_EMAIL = 'hazem.ashraf126@gmail.com';