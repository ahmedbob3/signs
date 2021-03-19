import 'package:Signs/Utils/constants.dart';
import 'package:intl/intl.dart';

class AppDateFormatPatterns {
  AppDateFormatPatterns._();
  // 2021-02-07T23:55:07.010828Z
  static const String standard = 'yyyy-MM-ddThh:mm:ss.SSSSSSZ';
  static const String serverDateTime = 'yyyy-MM-ddThh:mm:ss.SSSSSS';
  static const String dayMonthYear = 'yyyy/MM/dd';
  static const String dayMonthYearServer = 'yyyy-MM-dd';
  static const String dayMonthYearSpaced = 'dd MMM yyyy';
  static const String hoursMinsSecsSpaced = 'hh:mm a';
}

class AppDateFormats {
  factory AppDateFormats() => _instance;
  static AppDateFormats _instance = AppDateFormats._internal();
  AppDateFormats._internal();

  String lang =
  Constants.languageId == languages.Arabic
      ? 'ar'
      : Constants.languageId == languages.English
      ? 'en'
      : 'ind';

  DateFormat get standard =>
      DateFormat(AppDateFormatPatterns.standard, lang);

  DateFormat get dayMonthYear => DateFormat(AppDateFormatPatterns.dayMonthYear, lang);
  DateFormat get dayMonthYearSpaced => DateFormat(AppDateFormatPatterns.dayMonthYearSpaced, lang);
  DateFormat get dayMonthYearServer => DateFormat(AppDateFormatPatterns.dayMonthYearServer, lang);
  DateFormat get serverDateTime => DateFormat(AppDateFormatPatterns.serverDateTime, lang);
}
