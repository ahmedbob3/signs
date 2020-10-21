import 'package:Signs/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Screens/signup_screen_step1.dart';
import 'package:Signs/Screens/signup_screen_step3.dart';
import 'package:Signs/Screens/signup_sub_screen_step1.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';

import 'check_mobile_screen.dart';

class SignupScreenStep2 extends StatefulWidget {
  SignupScreenStep2({Key key}) : super(key: key);

  @override
  _SignupScreenStep2State createState() => _SignupScreenStep2State();
}

class _SignupScreenStep2State extends State<SignupScreenStep2> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();



  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var maleKey = GlobalKey<FormFieldState>();
  var femaleKey = GlobalKey<FormFieldState>();
  bool isActive= false;




  final bedTimeController = TextEditingController();
  final wakeTimeController = TextEditingController();

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
                              Strings().getSignupStep2Strings(),
                              style: titleStyle(
                                  fontFamily: boldFontFamily,
                                  color: defaultBackgroundColor,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getFirstNameStrings(),
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
                                      controller: _firstNameController,
                                      decoration: InputDecoration(
                                        hintText:
                                            Strings().getEnterFirstStrings(),
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
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getLastNameStrings(),
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
                                      controller: _lastNameController,
                                      decoration: InputDecoration(
                                        hintText:
                                            Strings().getEnterLastStrings(),
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
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getGenderStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive=!isActive;
                                    if(isActive==true)
                                      Constants.signUpData.setGender(Strings().getMaleStrings());
                                  });
                                },
                                child:
                                buttonChangeState(
                                    Male_inactive, Strings().getMaleStrings(),
                                    isFActive: isActive),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child:
                              new GestureDetector(
                                onTap: () {
                                setState(() {
                                  isActive=!isActive;
                                  if(isActive==true)
                                    Constants.signUpData.setGender(Strings().getFemaleStrings());
                                });
                                },
                                child:
                                buttonChangeState(
                                    Female_active, Strings().getFemaleStrings(),
                                    isFActive: !isActive),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getEmailStrings(),
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
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        hintText:
                                            Strings().getEnterEmailStrings(),
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
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 130),
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

                                if((_firstNameController.text.toString().length > 2 && _firstNameController.text.toString().length <= 20) && (_lastNameController.text.toString().length > 2 && _lastNameController.text.toString().length <= 20)){
                                  if(_emailController.text.toString().contains('@')&&_emailController.text.toString().contains('.')){
                                    Constants.signUpData.setFirstName(_firstNameController.text.toString());
                                    Constants.signUpData.setLastName(_lastNameController.text.toString());
                                    Constants.signUpData.setEmail(_emailController.text.toString());
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => SignupScreenStep3()));
                                  }
                                  else {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text(Strings().getEmailVerifyStrings()),
                                          duration: Duration(seconds: 3),
                                        ));
                                  }
                                }
                                else {
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text(Strings().getNameLengthStrings()),
                                        duration: Duration(seconds: 3),
                                      ));
                                }

                              }, Strings().getNextStrings(),
                                  isFilledColor: true),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
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
