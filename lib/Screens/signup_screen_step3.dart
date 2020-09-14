import 'package:flutter/material.dart';
import 'package:signs/Screens/signup_screen_step1.dart';
import 'package:signs/Screens/signup_screen_step3.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

import 'check_mobile_screen.dart';
import 'home_screen.dart';
import 'landing_screen.dart';

class SignupScreenStep3 extends StatefulWidget {
  SignupScreenStep3({Key key}) : super(key: key);

  @override
  _SignupScreenStep3State createState() => _SignupScreenStep3State();
}

class _SignupScreenStep3State extends State<SignupScreenStep3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Image.asset(
                      Login_background,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height ,
                    margin: EdgeInsets.only(
                        top: (Theme.of(context).platform == TargetPlatform.iOS
                            ? 30
                            : 30)),
                    padding: EdgeInsets.all(30),
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
                        Row(
                          children: <Widget>[
                            Text(
                              Strings().getSignupStrings(),
                              style: titleStyle(
                                  fontFamily: boldFontFamily,
                                  color: headerColor,
                                  fontSize: 24),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 205),
                            Text(
                              Strings().getSignupStep3Strings(),
                              style: titleStyle(
                                  fontFamily: boldFontFamily,
                                  color: defaultBackgroundColor,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getDatebirthStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                        "07/05/1992",
                                        hintStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: greyColor,
                                            fontSize: 16),
                                        labelStyle:
                                        titleStyle(color: greyColor),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: <Widget>[
                            Expanded(

                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(Strings().getHeightTStrings(),
                                        style: titleStyle(
                                            fontFamily: semiBoldFontFamily,
                                            color: greyHeader,
                                            fontSize: 14)),
                                    SizedBox(height: 15),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: textFieldFill,
                                          border: Border.all(
                                            color: textFieldBorder,
                                          ),
                                          borderRadius: BorderRadius.circular(18)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                    "165 cm",
                                                    hintStyle: titleStyle(
                                                        fontFamily: mediumFontFamily,
                                                        color: greyColor,
                                                        fontSize: 16),
                                                    labelStyle:
                                                    titleStyle(color: greyColor),
                                                    border: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    disabledBorder: InputBorder.none,
                                                  ),
                                                  keyboardType: TextInputType.number,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]
                              ),

                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(Strings().getWeightStrings(),
                                        style: titleStyle(
                                            fontFamily: semiBoldFontFamily,
                                            color: greyHeader,
                                            fontSize: 14)),
                                    SizedBox(height: 15),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: textFieldFill,
                                          border: Border.all(
                                            color: textFieldBorder,
                                          ),
                                          borderRadius: BorderRadius.circular(18)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                    "60 Kg",
                                                    hintStyle: titleStyle(
                                                        fontFamily: mediumFontFamily,
                                                        color: greyColor,
                                                        fontSize: 16),
                                                    labelStyle:
                                                    titleStyle(color: greyColor),
                                                    border: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    disabledBorder: InputBorder.none,
                                                  ),
                                                  keyboardType: TextInputType.number,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]
                              ),

                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getBedtimeStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                        "11:00 pm",
                                        hintStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: greyColor,
                                            fontSize: 16),
                                        labelStyle:
                                        titleStyle(color: greyColor),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getWaketimeStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                        "06:00 am",
                                        hintStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: greyColor,
                                            fontSize: 16),
                                        labelStyle:
                                        titleStyle(color: greyColor),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 80),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            new GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LandingScreen()));
                              },
                              child: new Text(
                                Strings().getSkipStrings(),
                                style: titleStyle(
                                    fontFamily: boldFontFamily,
                                    color: greyColor,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: new GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: button(
                                    null, Strings().getPreviousStrings(),
                                    isFilledColor: true),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: button(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LandingScreen()));
                              }, Strings().getSignupStrings(),
                                  isFilledColor: true),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              Strings().getHavingAccountStrings(),
                              style: titleStyle(
                                  fontFamily: mediumFontFamily,
                                  color: greyColor,
                                  fontSize: 14),
                            ),
                            new GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CheckMobileScreen()));
                              },
                              child: new Text(
                                Strings().getSingInText(),
                                style: titleStyle(
                                    fontFamily: mediumFontFamily,
                                    color: defaultBackgroundColor,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
