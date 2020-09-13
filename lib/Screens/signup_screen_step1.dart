import 'package:flutter/material.dart';
import 'package:signs/Screens/signup_screen_step2.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

class SignupScreenStep1 extends StatefulWidget {
  SignupScreenStep1({Key key}) : super(key: key);

  @override
  _SignupScreenStep1State createState() => _SignupScreenStep1State();
}

class _SignupScreenStep1State extends State<SignupScreenStep1> {
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
                headerBg(),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            (Theme.of(context).platform == TargetPlatform.iOS
                                ? 0.285
                                : 0.375)),
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
                              Strings().getSignupStep1Strings(),
                              style: titleStyle(
                                  fontFamily: boldFontFamily,
                                  color: defaultBackgroundColor,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(Strings().getSingupSlogan(),
                            style: titleStyle(
                                fontFamily: mediumFontFamily,
                                color: greyColor,
                                fontSize: 14)),
                        SizedBox(height: 20),
                        Text(Strings().getMobileNumberString(),
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
                                Image.asset(Kuwait_flag),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_drop_down),
                                SizedBox(width: 10),
                                Container(
                                    color: Color.fromRGBO(239, 239, 244, 1),
                                    width: 2,
                                    height: 60),
                                SizedBox(width: 10),
                                Text(
                                  '+995',
                                  style: titleStyle(
                                      fontFamily: mediumFontFamily,
                                      color: Colors.black,
                                      fontSize: 17),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: Strings()
                                            .getEnterMobileNumberString(),
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
                        Text(Strings().getPasswordStrings(),
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
                                            Strings().getEnterPasswordStrings(),
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
                        Text(Strings().getConfirmStrings(),
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
                                        hintText: Strings()
                                            .getConfirmPasswordStrings(),
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
                        SizedBox(height: 25),
                        button(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupScreenStep2()));
                        }, Strings().getNextStrings(), isFilledColor: true),
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
                                Navigator.of(context).pop();
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
