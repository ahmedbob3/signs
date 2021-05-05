import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService extends GetxService {
  LocalizationService._(this.currentLocale);

  AppLocale currentLocale;

  static LocalizationService init() {
    final AppLocale currentLocale =
        AppLocale(Get.find<SharedPreferencesService>().currentLocale);
    return LocalizationService._(currentLocale);
  }

  void updateLocale(AppLocale newLocale) async{
    currentLocale = newLocale;
    final SharedPreferencesService _spService =
        Get.find<SharedPreferencesService>();
    _spService.currentLocale = newLocale.value;
    Get.updateLocale(newLocale.locale);
    SharedPreferences _sharedPrefs =
        await SharedPreferences.getInstance();
    _sharedPrefs.setInt(
        'selectedLanguage', Constants.languageId.index);
  }

}

class AppLocale extends Enum<String> {
  const AppLocale(String value) : super(value);

  static const AppLocale arabic = AppLocale('ar_SA');
  static const AppLocale english = AppLocale('en_US');
  static const AppLocale indian = AppLocale('as_IN');

  static AppLocale get appDefault => AppLocale.english;

  Locale get locale {
    if (value != null) {
      final List<String> values = value.split('_');
      final String languageCode = values[0];
      final String countryCode = values[1];
      return Locale(languageCode, countryCode);
    } else {
      return AppLocale.appDefault.locale;
    }
  }

  String get languageCode {
    if (value != null) {
      final List<String> values = value.split('_');
      final String languageCode = values[0];
      return languageCode;
    } else {
      return null;
    }
  }
}
