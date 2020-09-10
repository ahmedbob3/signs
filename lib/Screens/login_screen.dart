import 'package:flutter/material.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 81, 173, 1),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                headerBg(),
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            (Theme.of(context).platform == TargetPlatform.iOS
                                ? 0.33
                                : 0.25)),
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
                              color: Color.fromRGBO(242, 242, 242, 1),
                              border: Border.all(
                                color: Color.fromRGBO(239, 239, 244, 1),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: <Widget>[
                                Image.asset(Kuwait_flag),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_drop_down),
                                SizedBox(width: 10),
                                Container(
                                    color: Color.fromRGBO(239, 239, 244, 1),
                                    width: 2,
                                    height: 60),
                                SizedBox(width: 10),
                                Text(
                                  '+966',
                                  style: titleStyle(
                                      fontFamily: boldFontFamily,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: Strings()
                                            .getEnterMobileNumberString(),
                                        hintStyle:
                                            titleStyle(color: Colors.grey),
                                        labelStyle:
                                            titleStyle(color: Colors.grey),
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
                        SizedBox(height: 30),
                        Text('Password',
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: Color.fromRGBO(193, 199, 208, 1))),
                        SizedBox(height: 20),
                        textField('Enter Password', () {}, prefixIcon: null),
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
                                      decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        button(() {}, Strings().getSingInText(),
                            isFilledColor: true),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Text('Already Have An Account ?',style: titleStyle(color: greyColor, fontFamily: mediumFontFamily),),
                          SizedBox(width: 5),
                          Text(Strings().getSingInText(), style: titleStyle(color: defaultBackgroundColor, fontFamily: mediumFontFamily),),
                        ],)
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
