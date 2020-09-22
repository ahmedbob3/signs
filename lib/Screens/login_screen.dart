import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signs/Blocs/login%20mobile%20bloc/login_mobile_bloc.dart';
import 'package:signs/Screens/home_screen.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  String mobileNumber;
  String selectedCountry;
  LoginScreen(
      {Key key, @required this.mobileNumber, @required this.selectedCountry})
      : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  LoginBloc _loginBloc;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 81, 173, 1),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: BlocBuilder<LoginBloc, LoginState>(
              bloc: _loginBloc,
              builder: (context, state) {

                if (state is LoginLoadingState) {
                showLoadingDialog(context);
              } else if (state is LoginLoadedState) {
                print('loaded');

                Future.delayed(Duration(milliseconds: 1), () {
                  if (state.loginResponse.code != 200) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(state.loginResponse.msg)));
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                });
              }

                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      headerBg(),
                      SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  (Theme.of(context).platform ==
                                          TargetPlatform.iOS
                                      ? 0.33
                                      : 0.35)),
                          padding: EdgeInsets.all(35),
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
                                Strings().getSingInText(),
                                style: titleStyle(
                                    fontFamily: boldFontFamily,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Text(Strings().getSinginSlogan(),
                                  style: titleStyle(
                                      fontFamily: mediumFontFamily,
                                      color: Color.fromRGBO(122, 134, 154, 1))),
                              SizedBox(height: 20),
                              Text(Strings().getMobileNumberString(),
                                  style: titleStyle(
                                      fontFamily: semiBoldFontFamily,
                                      color: Color.fromRGBO(193, 199, 208, 1))),
                              SizedBox(height: 20),
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
                                          enabled: false,
                                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                          initialSelection:
                                              widget.selectedCountry,
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
                                          color:
                                              Color.fromRGBO(239, 239, 244, 1),
                                          width: 2,
                                          height: 60),
                                      SizedBox(width: 10),
                                      Text(
                                        widget.selectedCountry,
                                        style: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: Colors.black,
                                            fontSize: 17),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          child: TextField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                              hintText: widget.mobileNumber,
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
                              SizedBox(height: 30),
                              Text(Strings().getPasswordStrings(),
                                  style: titleStyle(
                                      fontFamily: semiBoldFontFamily,
                                      color: Color.fromRGBO(193, 199, 208, 1))),
                              SizedBox(height: 20),
                              textField(
                                  Strings().getEnterPasswordStrings(), () {},
                                  prefixIcon: null,
                                  controller: passwordController,
                                  onChange: (value) {
                                setState(() {});
                              }),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Forget Password ?',
                                    style: titleStyle(
                                            fontSize: 14,
                                            fontFamily: mediumFontFamily,
                                            color: greyColor)
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  )
                                ],
                              ),
                              SizedBox(height: 30),
                              button(
                                  passwordController.text.isEmpty
                                      ? null
                                      : () {
                                        _loginBloc.add(doLoginEvent(widget.mobileNumber, passwordController.text));
                                      },
                                  Strings().getSingInText(),
                                  isFilledColor: true),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Already Have An Account ?',
                                    style: titleStyle(
                                        color: greyColor,
                                        fontFamily: mediumFontFamily),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    Strings().getSingInText(),
                                    style: titleStyle(
                                        color: defaultBackgroundColor,
                                        fontFamily: mediumFontFamily),
                                  ),
                                ],
                              )
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
                );
              }),
        ),
      ),
    );
  }
}
