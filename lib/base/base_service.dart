import 'package:Signs/Utils/constants.dart';

class BaseService{
  String lang =
  Constants.languageId == languages.Arabic
      ? 'ar'
      : Constants.languageId == languages.English
      ? 'en'
      : 'ind'
  ;
}