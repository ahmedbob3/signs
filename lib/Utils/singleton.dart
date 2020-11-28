import 'package:Signs/Models/login_model.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  LoginModel loginModel;
  String phoneNumber ;
  String countryCode;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}