import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
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
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Login_background),
                            fit: BoxFit.cover)),
                    child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          Login_shape,
                          fit: BoxFit.contain,
                        ))),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * (Theme.of(context).platform == TargetPlatform.iOS ? 0.335 : 0.355)),
                  padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: defaultBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(28),
                      topLeft: Radius.circular(28),
                    ),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Text(Strings().getWelcomeText(),
                            style: titleStyle(
                                fontFamily: boldFontFamily, fontSize: 32)),
                        Spacer(),
                        Text(Strings().getLoginTitle1(),
                            style: titleStyle(
                                fontFamily: boldFontFamily, fontSize: 18)),
                        SizedBox(height: 10),
                        Text(Strings().getLoginTitle2(),
                            style: titleStyle(
                                fontFamily: boldFontFamily, fontSize: 22)),
                        Spacer(),
                        button(() {}, Strings().getSingInText()),
                        SizedBox(height: 20),
                        button(() {}, Strings().getCreateAccountText(),
                            isFilledColor: false),
                        Spacer(),
                        Center(
                          child: Text(
                            Strings().getDiscoverApp(),
                            style: titleStyle()
                                .copyWith(decoration: TextDecoration.underline ,fontFamily: mediumFontFamily, fontSize: 14),
                          ),
                        ),
                        Spacer(),
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
