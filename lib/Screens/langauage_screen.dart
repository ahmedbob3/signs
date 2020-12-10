import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Signs/Screens/welcome_screen.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';

class LangauageScreen extends StatefulWidget {
  LangauageScreen({Key key}) : super(key: key);

  @override
  _LangauageScreenState createState() => _LangauageScreenState();
}

class _LangauageScreenState extends State<LangauageScreen> {
  int selectedLanguage = 2;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Constants.textDirection,
      child: Container(
        color: Color.fromRGBO(0, 81, 173, 1),
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
              Container(
              width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Login_background), fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    Hello_BG,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              (Theme.of(context).platform == TargetPlatform.iOS
                                  ? 0.36
                                  : 0.28)),
                      padding: EdgeInsets.all(35),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Strings().getWelcomeText(),
                            style: titleStyle(
                                fontFamily: boldFontFamily,
                                color: Colors.black,
                                fontSize: 32),
                          ),
                          SizedBox(height: 10),
                          Text(Strings().getSelectAppLanguageStrings(),
                              style: titleStyle(
                                  fontSize: 20,
                                  fontFamily: boldFontFamily,
                                  color: Color.fromRGBO(38, 114, 212, 1))),
                          SizedBox(height: 20),

                          // arabic language
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedLanguage = 1;
                                Constants.languageId = languages.Arabic;
                                Constants.textDirection = TextDirection.rtl;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Image.asset(Arabic_Flag),
                                  SizedBox(width: 10),
                                  Text(
                                    'Arabic - العربية',
                                    style: titleStyle(
                                        fontFamily: boldFontFamily,
                                        color: Color.fromRGBO(0, 34, 81, 1)),
                                  ),
                                ],
                              ),
                              decoration: selectedLanguage == 1
                                  ? BoxDecoration(
                                      color: Color.fromRGBO(33, 99, 206, 0.14),
                                      borderRadius: BorderRadius.circular(20))
                                  : null,
                            ),
                          ),
                          Divider(),

                          // english language
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedLanguage = 2;
                                Constants.languageId = languages.English;
                                Constants.textDirection = TextDirection.ltr;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Image.asset(English_Flag),
                                  SizedBox(width: 10),
                                  Text(
                                    'English',
                                    style: titleStyle(
                                        fontFamily: boldFontFamily,
                                        color: Color.fromRGBO(0, 34, 81, 1)),
                                  ),
                                ],
                              ),
                              decoration: selectedLanguage == 2
                                  ? BoxDecoration(
                                      color: Color.fromRGBO(33, 99, 206, 0.14),
                                      borderRadius: BorderRadius.circular(20))
                                  : null,
                            ),
                          ),
                          Divider(),

                          // hindi language
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedLanguage = 3;
                                Constants.languageId = languages.Indian;
                                Constants.textDirection = TextDirection.ltr;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Image.asset(Hindi_Flag),
                                  SizedBox(width: 10),
                                  Text(
                                    'Hindi',
                                    style: titleStyle(
                                        fontFamily: boldFontFamily,
                                        color: Color.fromRGBO(0, 34, 81, 1)),
                                  ),
                                ],
                              ),
                              decoration: selectedLanguage == 3
                                  ? BoxDecoration(
                                      color: Color.fromRGBO(33, 99, 206, 0.14),
                                      borderRadius: BorderRadius.circular(20))
                                  : null,
                            ),
                          ),

                          SizedBox(height: 30),
                          button(() async{
                            SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
                            _sharedPrefs.setInt('selectedLanguage', Constants.languageId.index);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
                          }, Strings().getSelectLabelStrings(), isFilledColor: true),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
