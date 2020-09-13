import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signs/Blocs/check mobile bloc/check_mobile_bloc.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

class ContinueLoginScreen extends StatefulWidget {
  ContinueLoginScreen({Key key}) : super(key: key);

  @override
  _ContinueLoginScreenState createState() => _ContinueLoginScreenState();
}

class _ContinueLoginScreenState extends State<ContinueLoginScreen> {
  CheckMobileBloc _checkMobileBloc;
  TextEditingController _mobileController = TextEditingController();
  String selectedCountry = '';
  String locale;
  @override
  void initState() {
    super.initState();
    _checkMobileBloc = CheckMobileBloc();
    getSimInfo();
  }

  Future<void> getSimInfo() async {
    await CountryCodes.init();
    setState(() {
      selectedCountry = CountryCodes.dialCode();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _checkMobileBloc.close();
    _mobileController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 81, 173, 1),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: BlocBuilder<CheckMobileBloc, CheckMobileState>(
            bloc: _checkMobileBloc,
            builder: (context, state) {
              if (state is CheckMobileLoadingState) {
                showLoadingDialog(context);
              } else if (state is CheckMobileLoadedState) {
                if (state.response.data.toMap().isEmpty) {
                  Future.delayed(Duration(milliseconds: 10), () {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(state.response.msg)));
                    Navigator.of(context).pop();
                  });
                } else {
                  print('xxx');
                }
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
                              Strings().getSingInText(),
                              style: titleStyle(
                                  fontFamily: boldFontFamily,
                                  color: headerColor,
                                  fontSize: 24),
                            ),
                            SizedBox(height: 10),
                            Text(Strings().getSinginSlogan(),
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
                                        onChanged: (countryCode) {
                                          setState(() {
                                            selectedCountry =
                                                countryCode.dialCode;
                                          });
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
                                        dialogTextStyle: titleStyle(fontFamily: mediumFontFamily, color:  Colors.black),
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
                                    Text(
                                      selectedCountry,
                                      style: titleStyle(
                                          fontFamily: mediumFontFamily,
                                          color: Colors.black,
                                          fontSize: 17),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        child: TextField(
                                          controller: _mobileController,
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
            },
          ),
        ),
      ),
    );
  }

  checkMobileNumber() {
    print('check');
    _checkMobileBloc.add(checkMobileNumberEvent(_mobileController.text));
  }

  // Widget _buildDropdownItem(Country country) {
  //   return SizedBox(
  //     width: 80,
  //     child: Row(
  //       children: <Widget>[
  //         CountryPickerUtils.getDefaultFlagImage(country),
  //         SizedBox(
  //           width: 8.0,
  //         ),
  //         // Icon(Icons.keyboard_arrow_down),
  //         // SizedBox(
  //         //   width: 8.0,
  //         // ),
  //         // Container(
  //         //     color: Color.fromRGBO(239, 239, 244, 1), width: 2, height: 60),
  //         // SizedBox(
  //         //   width: 8.0,
  //         // ),
  //         Expanded(child: Text("+${country.phoneCode}")),
  //       ],
  //     ),
  //   );
  // }
}
