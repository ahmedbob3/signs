import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Blocs/signUp%20bloc/signUp_bloc.dart';
import 'package:Signs/Screens/signup_screen_step2.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';

class SignupScreenStep1 extends StatefulWidget {
  final String phoneNumber;
  final String countryCode;
  SignupScreenStep1({Key key, this.phoneNumber = '', this.countryCode = ''})
      : super(key: key);

  @override
  _SignupScreenStep1State createState() => _SignupScreenStep1State();
}

class _SignupScreenStep1State extends State<SignupScreenStep1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String selectedCountry = '';
  int whichVerified = 0;

  @override
  void initState() {
    super.initState();
    _mobileController.text = widget.phoneNumber ?? '';
    selectedCountry = widget.countryCode == '+2' ? '+20' : widget.countryCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: _scaffoldKey,
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
                    headerBg(),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                (Theme.of(context).platform ==
                                        TargetPlatform.iOS
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
                                      fontFamily: HeavyBoldFontFamily,
                                      color: headerColor,
                                      fontSize: 24),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        205),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 40,
                                      child: CountryCodePicker(
                                        enabled: false,
                                        // onChanged: (countryCode) {
                                        //   setState(() {
                                        //     selectedCountry =
                                        //         widget.countryCode;
                                        //   });
                                        // },
                                        // onInit: (value) {
                                        //   selectedCountry = widget.countryCode;
                                        // },
                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                        initialSelection: selectedCountry,
                                        favorite: ['+20', '+965'],
                                        // optional. Shows only country name and flag
                                        showCountryOnly: false,
                                        // optional. Shows only country name and flag when popup is closed.
                                        showOnlyCountryWhenClosed: true,
                                        // optional. aligns the flag and the Text left
                                        alignLeft: false,
                                        // hideSearch: true,
                                        hideMainText: true,
                                        dialogTextStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.arrow_drop_down),
                                    SizedBox(width: 10),
                                    Container(
                                        color: Color.fromRGBO(239, 239, 244, 1),
                                        width: 2,
                                        height: 60),
                                    SizedBox(width: 10),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 3.0),
                                      child: Text(
                                        widget.countryCode == ''
                                            ? selectedCountry
                                            : widget.countryCode,
                                        style: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: Colors.black,
                                            fontSize: 17),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        child: TextField(
                                          controller: _mobileController,
                                          maxLength: 11,
                                          decoration: InputDecoration(
                                            counter: SizedBox.shrink(),
                                            hintText: widget.phoneNumber != ''
                                                ? widget.phoneNumber
                                                : Strings()
                                                    .getEnterMobileNumberString(),
                                            hintStyle: titleStyle(
                                                fontFamily: mediumFontFamily,
                                                color: greyColor,
                                                fontSize: 16),
                                            labelStyle:
                                                titleStyle(color: greyColor),
                                            enabled: widget.phoneNumber == '',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                          keyboardType: TextInputType.phone,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(Strings().getPassword(),
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
                                    color: whichVerified == 1 ||
                                            whichVerified == 12
                                        ? Colors.red[700]
                                        : textFieldBorder,
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
                                            controller: _passwordController,
                                            decoration: InputDecoration(
                                              hintText: Strings()
                                                  .getEnterPasswordStrings(),
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
                                                // if (value.isEmpty &&
                                                //     value.length < 8) {
                                                //   _scaffoldKey.currentState
                                                //       .showSnackBar(SnackBar(
                                                //     content: Text(Strings()
                                                //         .getPasswordStrings()),
                                                //     duration:
                                                //         Duration(seconds: 2),
                                                //   ));
                                                // }
                                                checkWhichVerified();
                                              });

                                              return null;
                                            },
                                            textInputAction: TextInputAction
                                                .next, // Move focus to next
                                            obscureText: true,
                                            keyboardType: TextInputType.text,
                                            onEditingComplete: () {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                              checkWhichVerified();
                                            },
                                            onTap: () {
                                              formKey.currentState.validate();
                                            } // Move focus to next

                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(Strings().getConfirmPasswordStrings(),
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
                                    color: whichVerified == 2 ||
                                            whichVerified == 12
                                        ? Colors.red[700]
                                        : textFieldBorder,
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
                                            controller: _confirmController,
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
                                            validator: (value) {
                                              setState(() {
                                                // if (value.isEmpty &&
                                                //     value.length < 8) {
                                                //   _scaffoldKey.currentState
                                                //       .showSnackBar(SnackBar(
                                                //     content: Text(Strings()
                                                //         .getConfirmPassword()),
                                                //     duration:
                                                //         Duration(seconds: 2),
                                                //   ));
                                                // }
                                                checkWhichVerified();
                                              });

                                              return null;
                                            },
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: true,
                                            keyboardType: TextInputType.text,
                                            onEditingComplete: () {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                              checkWhichVerified();
                                            },
                                            onTap: () {
                                              formKey.currentState.validate();
                                            } // Move focus to next

                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            button(() {
                              if (_passwordController.text.toString().length >=
                                  8) {
                                if (_passwordController.text.toString() ==
                                    _confirmController.text.toString()) {
                                  Constants.signUpData.setMobileNumber(
                                      _mobileController.text.toString());
                                  Constants.signUpData.setPassword(
                                      _passwordController.text.toString());
                                  Constants.signUpData.setCountryCode(
                                      widget.countryCode == ''
                                          ? selectedCountry
                                          : widget.countryCode);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          SignupScreenStep2()));
                                } else {
                                  _scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text(Strings().getConfirmPassword()),
                                    duration: Duration(seconds: 3),
                                  ));
                                  checkWhichVerified();
                                }
                              } else {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(Strings().getPasswordStrings()),
                                  duration: Duration(seconds: 3),
                                ));
                                checkWhichVerified();
                              }
                            }, Strings().getNextStrings(), isFilledColor: true),
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
        ),
      ),
    );
  }

  void checkWhichVerified() {
    if ((_passwordController.text.toString().isEmpty ||
            _passwordController.text.length < 8) &&
        (_confirmController.text.toString().isEmpty ||
            _confirmController.text.length < 8)) {
      whichVerified = 12;
    } else if ((_passwordController.text.toString().isEmpty ||
        _passwordController.text.length < 8)) {
      whichVerified = 1;
    } else if ((_confirmController.text.toString().isEmpty ||
        _confirmController.text.length < 8)) {
      whichVerified = 2;
    } else
      whichVerified = 0;
  }
}
