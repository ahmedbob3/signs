import 'package:Signs/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Screens/signup_screen_step1.dart';
import 'package:Signs/Screens/signup_screen_step3.dart';
import 'package:Signs/Screens/signup_sub_screen_step1.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

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
  final formKey = GlobalKey<FormState>();


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var maleKey = GlobalKey<FormFieldState>();
  var femaleKey = GlobalKey<FormFieldState>();
  bool isActiveFemale = false;
  bool isActiveMale = false;
  int whichVerified = 0;



  final bedTimeController = TextEditingController();
  final wakeTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key : _scaffoldKey,
          body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
    child: Form(
    key: formKey,
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
                      height: MediaQuery.of(context).size.height,
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
                                    fontFamily: HeavyBoldFontFamily,
                                    color: headerColor,
                                    fontSize: 24),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 205),
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
                                  color: _firstNameController.text.isNotEmpty  ? textFieldBorder : Colors.red[700],
                                ),
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
                                          controller: _firstNameController,
                                          textCapitalization:
                                              TextCapitalization.sentences,

                                          decoration: InputDecoration(
                                            hintText: Strings()
                                                .getEnterFirstStrings(),
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


                                          validator: (value) {
                                            setState(() {
                                              if (value.isEmpty) {
                                                _scaffoldKey.currentState
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      Strings().getEnterFirstStrings()),
                                                  duration: Duration(seconds: 2),
                                                ));
                                              }
                                            });

                                            return null;
                                          },
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          onEditingComplete: () {
                                            FocusScope.of(context).nextFocus();
                                          } // Move focus to next
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
                                  color: _lastNameController.text.isNotEmpty  ? textFieldBorder : Colors.red[700],
                                ),
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
                                        controller: _lastNameController,
                                          textCapitalization:
                                          TextCapitalization.sentences,
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
                                          validator: (value) {
                                          setState(() {
                                            if (value.isEmpty) {
                                              _scaffoldKey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    Strings().getEnterLastStrings()),
                                                duration: Duration(seconds: 2),
                                              ));
                                            }
                                          });

                                            return null;
                                          },
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        onEditingComplete: () => FocusScope.of(
                                                context)
                                            .nextFocus(), // Move focus to next
                                          onTap: () {
                                            formKey.currentState.validate();
                                          }
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
                                child: new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isActiveMale = !isActiveMale;
                                      isActiveFemale = !isActiveMale;
                                      if (isActiveMale == true)
                                        Constants.signUpData.setGender(
                                            Strings().getMaleStrings());
                                    });
                                  },
                                  child: buttonChangeState(
                                      Male_inactive, Strings().getMaleStrings(),
                                      isFActive: isActiveMale),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isActiveFemale = !isActiveFemale;
                                      isActiveMale = !isActiveFemale;
                                      if (isActiveFemale == true)
                                        Constants.signUpData.setGender(
                                            Strings().getFemaleStrings());
                                    });
                                  },
                                  child: buttonChangeState(Female_active,
                                      Strings().getFemaleStrings(),
                                      isFActive: isActiveFemale),
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
                                  color: _firstNameController.text.isNotEmpty  ? textFieldBorder : Colors.red[700],
                                ),
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
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
                                          onTap: () {
                                            formKey.currentState.validate();
                                          }
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

                                  if ((_firstNameController.text.toString().length > 2 && _firstNameController.text.toString().length <= 20) && (_lastNameController.text.toString().length > 2 && _lastNameController.text.toString().length <= 20)) {
                                    if (_emailController.text.toString().contains('@') && _emailController.text.toString().contains('.')) {
                                      Constants.signUpData.setFirstName(_firstNameController.text.toString());
                                      Constants.signUpData.setLastName(_lastNameController.text.toString());
                                      Constants.signUpData.setEmail(_emailController.text.toString());
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreenStep3()));
                                    } else {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            Strings().getEmailVerifyStrings()),
                                        duration: Duration(seconds: 3),
                                      ));
                                    }
                                  } else {
                                    _scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          Strings().getNameLengthStrings()),
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
                                      builder: (context) =>
                                          CheckMobileScreen()));
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
        ),
      ),
    );
  }

  void checkWhichVerified() {
    if (_firstNameController.text.toString().isEmpty && _lastNameController.text.toString().isEmpty && _emailController.text.toString().contains('@') && _emailController.text.toString().contains('.')) {
      whichVerified = 4;
    }
    else if (_firstNameController.text.toString().isEmpty) {
      whichVerified = 1;
    }
    else if (_lastNameController.text.toString().isEmpty) {
      whichVerified = 2;
    }
    else whichVerified=0;
  }


}
