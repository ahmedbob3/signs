import 'dart:async';
import 'dart:ui';

import 'package:Signs/Screens/signup_screen_step1.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Blocs/login%20mobile%20bloc/login_mobile_bloc.dart';
import 'package:Signs/Screens/login_screen.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';

import 'otp_screen.dart';

class CheckMobileScreen extends StatefulWidget {
  bool isSignIn;
  CheckMobileScreen({Key key, this.isSignIn = false}) : super(key: key);

  @override
  _CheckMobileScreenState createState() => _CheckMobileScreenState();
}

class _CheckMobileScreenState extends State<CheckMobileScreen> {
  LoginBloc _loginBloc;
  TextEditingController _mobileController = TextEditingController();
  String selectedCountry = '';
  FocusNode focusNode = FocusNode();
  bool isLoading = false;
  bool hasError = false;
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    getSimInfo();
  }

  Future<void> getSimInfo() async {
    try {
      await CountryCodes.init();
    } catch (e) {
      print('xxx');
    }

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
    _mobileController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Directionality(
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
              body: BlocBuilder<LoginBloc, LoginState>(
                bloc: _loginBloc,
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    if (!isLoading) {
                      showLoadingDialog(context);
                      isLoading = true;
                    }
                  } else if (state is LoginLoadedState) {
                    print('loaded');

                    Future.delayed(Duration(milliseconds: 1), () {
                      Navigator.of(context).pop();
                      if (state.checkMobileResponse.code == 200) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PinCodeVerificationScreen(
                                _mobileController.text,
                                selectedCountry)));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                mobileNumber: _mobileController.text,
                                selectedCountry: selectedCountry)));
                      }

                      _loginBloc.add(resetState());
                      isLoading = false;
                    });
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        headerBg(),
                        SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    (Theme.of(context).platform ==
                                            TargetPlatform.iOS
                                        ? 0.33
                                        : 0.4)),
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
                                Text(
                                  widget.isSignIn
                                      ? Strings().getSingInText()
                                      : Strings().getSignupStrings(),
                                  style: titleStyle(
                                      fontFamily: boldFontFamily,
                                      color: headerColor,
                                      fontSize: 24),
                                ),
                                SizedBox(height: 10),
                                Text(
                                    widget.isSignIn
                                        ? Strings().getSinginSlogan()
                                        : Strings().getSingupSlogan(),
                                    style: titleStyle(
                                        fontFamily: mediumFontFamily,
                                        color: greyColor,
                                        fontSize: 16)),
                                SizedBox(height: 20),
                                Text(Strings().getMobileNumberString(),
                                    style: titleStyle(
                                        fontFamily: semiBoldFontFamily,
                                        color: greyHeader,
                                        fontSize: 16)),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 40,
                                          child: CountryCodePicker(
                                            onChanged: (countryCode) {
                                              setState(() {
                                                selectedCountry =
                                                    countryCode.dialCode;

                                                if (selectedCountry == '+965' &&
                                                    _mobileController
                                                            .text.length >
                                                        8) {
                                                  _mobileController.text =
                                                      _mobileController.text
                                                          .replaceRange(
                                                              8, 11, '');
                                                }
                                                selectedCountry =
                                                    selectedCountry == '+20'
                                                        ? '+2'
                                                        : selectedCountry;
                                              });
                                            },
                                            onInit: (countryCode) {
                                              // setState(() {
                                              selectedCountry =
                                                  countryCode.dialCode;

                                              selectedCountry =
                                                  selectedCountry == '+20'
                                                      ? '+2'
                                                      : selectedCountry;
                                              // });
                                            },
                                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                            initialSelection:
                                                CountryCodes.dialCode(),
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
                                            color: Color.fromRGBO(
                                                239, 239, 244, 1),
                                            width: 2,
                                            height: 60),
                                        SizedBox(width: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 3.0),
                                          child: Text(
                                            selectedCountry,
                                            style: titleStyle(
                                                fontFamily: mediumFontFamily,
                                                color: Colors.black,
                                                fontSize: 17),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Form(
                                            key: _formKey,
                                            child: Container(
                                              child: TextFormField(
                                                controller: _mobileController,
                                                focusNode: focusNode,
                                                maxLength:
                                                    selectedCountry == '+2'
                                                        ? 11
                                                        : 8,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                  counter: SizedBox.shrink(),
                                                  hintText: Strings()
                                                      .getEnterMobileNumberString(),
                                                  hintStyle: titleStyle(
                                                      fontFamily:
                                                          mediumFontFamily,
                                                      color: greyColor,
                                                      fontSize: 16),
                                                  labelStyle: titleStyle(
                                                      color: greyColor),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                keyboardType:
                                                    TextInputType.phone,
                                                onChanged: (value) {
                                                  setState(() {
                                                    // _mobileController.text = value;
                                                  });
                                                },
                                                validator: (value) {
                                                  if ((selectedCountry ==
                                                              '+2' &&
                                                          value.length < 10) ||
                                                      (selectedCountry ==
                                                              '+965' &&
                                                          value.length < 8)) {
                                                    setState(() {
                                                      hasError = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      hasError = false;
                                                    });
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                hasError
                                    ? Text(
                                        Strings().getEnterMobileNumberString(),
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : Container(),
                                SizedBox(height: 30),
                                button(
                                    _mobileController.text.isEmpty
                                        ? null
                                        : checkMobileNumber,
                                    Strings().getContinueStrings(),
                                    isFilledColor: true),
                                Spacer()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkMobileNumber() {
    _formKey.currentState.validate();
    if (hasError) {
    } else {
      if (selectedCountry == '+2' && _mobileController.text[0] != '0') {
        setState(() {
          hasError = true;
        });
      } else {
        focusNode.unfocus();
        _loginBloc.add(checkMobileNumberEvent(_mobileController.text));
      }
    }
  }
}
