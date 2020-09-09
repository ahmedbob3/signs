import 'package:signs/Utils/Strings%20Data/strings_ar.dart';
import 'package:signs/Utils/Strings%20Data/strings_en.dart';
import 'package:signs/Utils/Strings%20Data/strings_inr.dart';
import 'package:signs/Utils/constants.dart';

class Strings {
  String appName() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.APP_NAME;
        break;
      case languages.Indian:
        return Strings_INR.APP_NAME;
        break;
      default:
        return Strings_EN.APP_NAME;
    }
  }

  String getWelcomeText() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.WELCOME;
        break;
      case languages.Indian:
        return Strings_INR.WELCOME;
        break;
      default:
        return Strings_EN.WELCOME;
    }
  }

  String getLoginTitle1() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.LOGIN_TITLE1;
        break;
      case languages.Indian:
        return Strings_INR.LOGIN_TITLE1;
        break;
      default:
        return Strings_EN.LOGIN_TITLE1;
    }
  }

  String getLoginTitle2() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.LOGIN_TITLE2;
        break;
      case languages.Indian:
        return Strings_INR.LOGIN_TITLE2;
        break;
      default:
        return Strings_EN.LOGIN_TITLE2;
    }
  }

  String getSingInText() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SIGN_IN;
        break;
      case languages.Indian:
        return Strings_INR.SIGN_IN;
        break;
      default:
        return Strings_EN.SIGN_IN;
    }
  }

  String getCreateAccountText() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.CREATE_ACCOUNT;
        break;
      case languages.Indian:
        return Strings_INR.CREATE_ACCOUNT;
        break;
      default:
        return Strings_EN.CREATE_ACCOUNT;
    }
  }

  String getDiscoverApp() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DISCOVER_APP;
        break;
      case languages.Indian:
        return Strings_INR.DISCOVER_APP;
        break;
      default:
        return Strings_EN.DISCOVER_APP;
    }
  }

  String getSinginSlogan() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_IN_SLOGAN;
        break;
      case languages.Indian:
        return Strings_INR.SING_IN_SLOGAN;
        break;
      default:
        return Strings_EN.SING_IN_SLOGAN;
    }
  }

  String getMobileNumberString(){
   switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MOBILE_NUMBER;
        break;
      case languages.Indian:
        return Strings_INR.MOBILE_NUMBER;
        break;
      default:
        return Strings_EN.MOBILE_NUMBER;
    }
  }

  String getEnterMobileNumberString(){
   switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.ENTER_MOBILE_NUMBER;
        break;
      case languages.Indian:
        return Strings_INR.ENTER_MOBILE_NUMBER;
        break;
      default:
        return Strings_EN.ENTER_MOBILE_NUMBER;
    }
  }

  String getContinueStrings(){
   switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.CONTINUE;
        break;
      case languages.Indian:
        return Strings_INR.CONTINUE;
        break;
      default:
        return Strings_EN.CONTINUE;
    }
  }
}
