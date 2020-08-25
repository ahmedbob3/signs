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
}
