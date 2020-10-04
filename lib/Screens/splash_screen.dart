import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signs/Screens/langauage_screen.dart';
import 'package:signs/Screens/welcome_screen.dart';
import 'package:signs/Utils/constants.dart';
import 'package:signs/Utils/images.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkForLanguage();
  }

  checkForLanguage() async {
    _prefs.then((SharedPreferences prefs) async {
      Constants.languageId =
          languages.values[prefs.getInt('selectedLanguage') ?? 0];
      Constants.updateTextDirection();
      await new Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => prefs.getInt('selectedLanguage') == null
                ? LangauageScreen()
                : WelcomeScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(SplashBG), fit: BoxFit.cover),
      ),
      child: Center(
        child: Image.asset(SignsLogo),
      ),
    );
  }
}
