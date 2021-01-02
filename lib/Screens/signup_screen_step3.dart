import 'package:Signs/Blocs/signUp%20bloc/signUp_bloc.dart';
import 'package:Signs/Screens/login_screen.dart';
import 'package:Signs/Screens/otp_screen.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:intl/intl.dart';

import 'check_mobile_screen.dart';
import 'landing_screen.dart';

class SignupScreenStep3 extends StatefulWidget {
  SignupScreenStep3({Key key}) : super(key: key);

  @override
  _SignupScreenStep3State createState() => _SignupScreenStep3State();
}

class _SignupScreenStep3State extends State<SignupScreenStep3> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController bedTimeController = TextEditingController();
  TextEditingController wakeTimeController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  SignUpBloc _signUpBloc;
  bool isLoading = false;
  bool isSkipClicked = false;

  @override
  void dispose() {
    super.dispose();
    dateOfBirthController.dispose();
    bedTimeController.dispose();
    wakeTimeController.dispose();
    heightController.dispose();
    weightController.dispose();
    _signUpBloc.close();
  }

  @override
  void initState() {
    super.initState();
    _signUpBloc = SignUpBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Constants.textDirection,
      child: Container(
        color: defaultBackgroundColor,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            key: _scaffoldKey,
            body: new GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: BlocBuilder<SignUpBloc, SignUpState>(
                bloc: _signUpBloc,
                builder: (context, state) {
                  if (state is SignUpLoadingState) {
                    if (!isLoading) {
                      showLoadingDialog(context);
                      isLoading = true;
                    }
                  } else if (state is SignUpLoadedState) {
                    print('loaded');

                    Future.delayed(Duration(milliseconds: 1), () {
                      if (state.sigupresponse.code != 200) {
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text(state.sigupresponse.msg)));
                        Navigator.of(context).pop();

                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        mobileNumber:
                                            Constants.signUpData.mobileNumber,
                                        selectedCountry:
                                            Constants.signUpData.countryCode,
                                      )));
                        });
                      } else {
                        isSkipClicked ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LandingScreen())) : 
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LandingScreen()));
                      }
                      _signUpBloc.add(resetSignupState());
                      isLoading = false;
                    });
                  }
                  return Container(
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
                            height: MediaQuery.of(context).size.height,
                            margin: EdgeInsets.only(
                                top: (Theme.of(context).platform ==
                                        TargetPlatform.iOS
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
                                    Spacer(),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(1940, 1, 1),
                                                  maxTime:
                                                      DateTime(2020, 12, 31),
                                                  theme: DatePickerTheme(
                                                      headerColor: Colors.white,
                                                      backgroundColor:
                                                          Colors.white,
                                                      itemStyle: TextStyle(
                                                          color: headerColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                      doneStyle: TextStyle(
                                                          color: headerColor,
                                                          fontSize: 16)),
                                                  onChanged: (date) {
                                                dateOfBirthController.text =
                                                    (DateFormat('dd-MM-yyyy')
                                                        .format(date)
                                                        .toString());
                                                print(
                                                    'change $date in time zone ' +
                                                        date.timeZoneOffset
                                                            .inHours
                                                            .toString());
                                              }, onConfirm: (date) {
                                                dateOfBirthController.text =
                                                    (DateFormat('dd-MM-yyyy')
                                                        .format(date)
                                                        .toString());
                                                Constants.signUpData
                                                    .setBirthDate(
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(date)
                                                            .toString());
                                              },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.en);
                                            },
                                            child: Container(
                                              child: TextField(
                                                enabled: false,
                                                controller:
                                                    dateOfBirthController,
                                                decoration: InputDecoration(
                                                  hintText: "07-05-1992",
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
                                                // keyboardType: TextInputType.number,
                                              ),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(Strings().getHeightTStrings(),
                                                style: titleStyle(
                                                    fontFamily:
                                                        semiBoldFontFamily,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                        child: TextField(
                                                          controller:
                                                              heightController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: "165 cm",
                                                            hintStyle: titleStyle(
                                                                fontFamily:
                                                                    mediumFontFamily,
                                                                color:
                                                                    greyColor,
                                                                fontSize: 16),
                                                            labelStyle: titleStyle(
                                                                color:
                                                                    greyColor),
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            disabledBorder:
                                                                InputBorder
                                                                    .none,
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(Strings().getWeightStrings(),
                                                style: titleStyle(
                                                    fontFamily:
                                                        semiBoldFontFamily,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                        child: TextField(
                                                          controller:
                                                              weightController,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: "60 Kg",
                                                            hintStyle: titleStyle(
                                                                fontFamily:
                                                                    mediumFontFamily,
                                                                color:
                                                                    greyColor,
                                                                fontSize: 16),
                                                            labelStyle: titleStyle(
                                                                color:
                                                                    greyColor),
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            disabledBorder:
                                                                InputBorder
                                                                    .none,
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              DatePicker.showTime12hPicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onChanged: (date) {
                                                bedTimeController.text =
                                                    (DateFormat('hh:mm a')
                                                        .format(date)
                                                        .toString());
                                                print(
                                                    'change $date in time zone ' +
                                                        date.timeZoneOffset
                                                            .inHours
                                                            .toString());
                                              }, onConfirm: (date) {
                                                bedTimeController.text =
                                                    (DateFormat('hh:mm a')
                                                        .format(date)
                                                        .toString());
                                                Constants.signUpData.setBedTime(
                                                    DateFormat('hh:mm')
                                                        .format(date)
                                                        .toString());
                                              }, currentTime: DateTime.now());
                                            },
                                            child: Container(
                                              child: TextField(
                                                enabled: false,
                                                controller: bedTimeController,
                                                decoration: InputDecoration(
                                                  hintText: "11:00 pm",
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
                                                // keyboardType: TextInputType.number,
                                              ),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              DatePicker.showTime12hPicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onChanged: (date) {
                                                wakeTimeController.text =
                                                    (DateFormat('hh:mm a')
                                                        .format(date)
                                                        .toString());
                                                print(
                                                    'change $date in time zone ' +
                                                        date.timeZoneOffset
                                                            .inHours
                                                            .toString());
                                              }, onConfirm: (date) {
                                                wakeTimeController.text =
                                                    (DateFormat('hh:mm a')
                                                        .format(date)
                                                        .toString());
                                                Constants.signUpData
                                                    .setWakeupTime(
                                                        DateFormat('hh:mm')
                                                            .format(date)
                                                            .toString());
                                              }, currentTime: DateTime.now());
                                            },
                                            child: Container(
                                              child: TextField(
                                                enabled: false,
                                                controller: wakeTimeController,
                                                decoration: InputDecoration(
                                                  hintText: "06:00 am",
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
                                                // keyboardType: TextInputType.number,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             LandingScreen()));
                                        isSkipClicked = true;
                                        doSignup();
                                      },
                                      child: new Text(
                                        Strings().getSkipStrings(),
                                        style: titleStyle(
                                            fontFamily: boldFontFamily,
                                            color: linkColor,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: new GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: button(null,
                                            Strings().getPreviousStrings(),
                                            isFilledColor: true),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: button(() {
                                        doSignup();
                                      }, Strings().getSignupStrings(),
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  doSignup() {
    if (dateOfBirthController.text.toString().isNotEmpty &&
        bedTimeController.text.toString().isNotEmpty &&
        wakeTimeController.text.toString().isNotEmpty &&
        heightController.text.toString().isNotEmpty &&
        weightController.text.toString().isNotEmpty || isSkipClicked) {
      Constants.signUpData.setWeight(isSkipClicked ? '' : weightController.text.toString());
      Constants.signUpData.setHeight(isSkipClicked ? '' : heightController.text.toString());

      _signUpBloc.add(doSignUpEvent(
          Constants.signUpData.getMobileNumber(),
          Constants.signUpData.getFirstName(),
          Constants.signUpData.getLastName(),
          Constants.signUpData.getEmail(),
          Constants.signUpData.getPassword(),
          Constants.signUpData.getGender(),
          isSkipClicked ? '' : Constants.signUpData.getBirthDate(),
          isSkipClicked ? '' : Constants.signUpData.getWeight(),
          isSkipClicked ? '' : Constants.signUpData.getHeight(),
          isSkipClicked ? '' : Constants.signUpData.getBedTime(),
          isSkipClicked ? '' : Constants.signUpData.getWakeupTime()));
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(Strings().getFillDataString()),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
