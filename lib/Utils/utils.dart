import 'package:Signs/Screens/check_mobile_screen.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showComingSoonMessage(){
  Get.snackbar(
    S.of(Get.context).comingSoon,
      S.of(Get.context).willBeAdded,
    snackPosition: SnackPosition.BOTTOM
  );
}

showNeedSignInDialog(BuildContext context, String msg) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text(Strings().getSingInText()),
    onPressed: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CheckMobileScreen(isSignIn: true)));
    },
  );
  Widget continueButton = FlatButton(
    child: Text(Strings().getSignupStrings()),
    onPressed: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CheckMobileScreen(isSignIn: false)));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text(""),
    content: Text(msg),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}