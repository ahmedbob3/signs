import 'package:flutter/material.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

class LangauageScreen extends StatefulWidget {
  LangauageScreen({Key key}) : super(key: key);

  @override
  _LangauageScreenState createState() => _LangauageScreenState();
}

class _LangauageScreenState extends State<LangauageScreen> {
  int selectedLanguage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 81, 173, 1),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                headerBg(),
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            (Theme.of(context).platform == TargetPlatform.iOS
                                ? 0.33
                                : 0.25)),
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
                              fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(Strings().getSelectAppLanguageStrings(),
                            style: titleStyle(
                                fontSize: 18,
                                fontFamily: mediumFontFamily,
                                color: defaultBackgroundColor)),
                        SizedBox(height: 20),

                        // arabic language
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedLanguage = 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Image.asset(Arabic_Flag),
                                SizedBox(width: 10),
                                Text(
                                  'Arabic',
                                  style: titleStyle(
                                      fontFamily: boldFontFamily,
                                      color: Color.fromRGBO(0, 34, 81, 1)),
                                ),
                              ],
                            ),
                            decoration: selectedLanguage == 1 ? BoxDecoration(
                                color: Color.fromRGBO(33, 99, 206, 0.14),
                                borderRadius: BorderRadius.circular(20)) : null,
                          ),
                        ),
                        Divider(),

                        // english language
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedLanguage = 2;
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
                            decoration: selectedLanguage == 2 ? BoxDecoration(
                                color: Color.fromRGBO(33, 99, 206, 0.14),
                                borderRadius: BorderRadius.circular(20)) : null,
                          ),
                        ),
                        Divider(),

                        // hindi language
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedLanguage = 3;
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
                            decoration: selectedLanguage == 3 ? BoxDecoration(
                                color: Color.fromRGBO(33, 99, 206, 0.14),
                                borderRadius: BorderRadius.circular(20)) : null,
                          ),
                        ),

                        SizedBox(height: 30),
                        button(() {}, "Select",
                            isFilledColor: true),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    top: 5,
                    left: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
