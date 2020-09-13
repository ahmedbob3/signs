import 'package:flutter/material.dart';
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            (Theme.of(context).platform == TargetPlatform.iOS
                                ? 0.33
                                : 0.44)),
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
                                        hintText: Strings().getEnterMobileNumberString(),
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
                        SizedBox(height: 30),
                        button(null, Strings().getContinueStrings(), isFilledColor: true),
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
