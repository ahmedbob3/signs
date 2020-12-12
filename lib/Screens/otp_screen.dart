import 'dart:async';

import 'package:Signs/Screens/landing_screen.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Text(
                    Strings.getPhoneVerificationString(),
                    style: titleStyle(
                        fontFamily: boldFontFamily,
                        fontSize: 28,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(Strings.getEnterOTPString(),
                    style: titleStyle(
                        color: Colors.black,
                        fontFamily: boldFontFamily,
                        fontSize: 20)),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 50),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 3) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 70,
                          fieldWidth: 60,
                          activeFillColor:
                              hasError ? Colors.red : defaultBackgroundColor,
                          activeColor: defaultBackgroundColor,
                          selectedFillColor: defaultBackgroundColor,
                          selectedColor: defaultBackgroundColor,
                          inactiveFillColor: Colors.grey[300],
                          disabledColor: Colors.white,
                          inactiveColor: Colors.grey[300]),
                      animationDuration: Duration(milliseconds: 300),
                      textStyle:
                          titleStyle(fontSize: 30, fontFamily: boldFontFamily),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        print("Completed");
                        setState(() {
                          hasError = v != '1234';
                        });
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                          if (currentText.length < 4) {
                            hasError = false;
                          }
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              SizedBox(
                height: 90,
              ),
              Center(
                child: Text(Strings.getNotGetCodeString(),
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                      fontFamily: mediumFontFamily,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  // onTap: onTapRecognizer,
                  child: Text(Strings.getResendOTPString(),
                      style: TextStyle(
                          color: defaultBackgroundColor,
                          fontFamily: mediumFontFamily,
                          fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 44,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: button(() {
                  formKey.currentState.validate();
                  // conditions for validating
                  if (currentText.length != 4 || currentText != "1234") {
                    errorController.add(ErrorAnimationType
                        .shake); // Triggering error shake animation
                    setState(() {
                      hasError = true;
                    });
                  } else {
                    setState(() {
                      hasError = false;
                      Future.delayed(Duration(milliseconds: 1), () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingScreen()));
                      });
                    });
                  }
                }, Strings.getVerifiyString(), isFilledColor: true),
              ),
              SizedBox(
                height: 16,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     FlatButton(
              //       child: Text("Clear"),
              //       onPressed: () {
              //         textEditingController.clear();
              //       },
              //     ),
              //     FlatButton(
              //       child: Text("Set Text"),
              //       onPressed: () {
              //         textEditingController.text = "123456";
              //       },
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
