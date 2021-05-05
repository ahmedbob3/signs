import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesKeys {
  SharedPreferencesKeys._();
  static const String currentLocale = 'currentLocale';
  static const String selectedLanguage = 'selectedLanguage';
}

class SharedPreferencesService extends GetxService {
  SharedPreferencesService._(this._prefs);

  final SharedPreferences _prefs;

  static Future<SharedPreferencesService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return SharedPreferencesService._(prefs);
  }

  String get currentLocale {
    return _prefs.getString(SharedPreferencesKeys.currentLocale);
  }

  set currentLocale(String currentLocale) {
    _prefs.setString(SharedPreferencesKeys.currentLocale, currentLocale);
  }

  set selectedLanguage(int selectedLanguage){
    _prefs.setInt(SharedPreferencesKeys.selectedLanguage, selectedLanguage);
  }
}
