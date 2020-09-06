import 'package:flutter/material.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 81, 173, 1),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    child: Image.asset(
                      LOGIN_BACKGROUND,
                      fit: BoxFit.fitWidth,
                    )),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.33),
                  decoration: BoxDecoration(
                    color: defaultBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Text('Welcome',
                            style: titleStyle(
                                fontFamily: boldFontFamily, fontSize: 32)),
                        Spacer(),
                        Text('Offline and online appoitmnet',
                            style: titleStyle(
                                fontFamily: boldFontFamily, fontSize: 18)),
                        SizedBox(height: 10),
                        Text('To Your Health care app',
                            style: titleStyle(
                                fontFamily: boldFontFamily, fontSize: 22)),
                        Spacer(),
                        button(null, 'Sign In')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
