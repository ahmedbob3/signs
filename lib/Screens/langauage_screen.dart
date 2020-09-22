import 'package:flutter/material.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

class LangauageScreen extends StatefulWidget {
  LangauageScreen({Key key}) : super(key: key);

  @override
  _LangauageScreenState createState() => _LangauageScreenState();
}

class _LangauageScreenState extends State<LangauageScreen> {
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
                        
                        SizedBox(height: 30),
                        button(() {}, Strings().getSingInText(),
                            isFilledColor: true),
                        SizedBox(height: 30),                        
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
