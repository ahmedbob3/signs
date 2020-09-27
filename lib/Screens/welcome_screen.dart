import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signs/Blocs/login%20mobile%20bloc/login_mobile_bloc.dart';

import 'package:signs/Screens/check_mobile_screen.dart';
import 'package:signs/Screens/login_screen.dart';
import 'package:signs/Screens/signup_screen_step1.dart';
import 'package:signs/Utils/constants.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/strings.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/widgets.dart';

import 'medicine_add.dart';
import 'medicine_form.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Constants.languageId == languages.Arabic
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Container(
        color: Color.fromRGBO(0, 81, 173, 1),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  headerBg(),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height *
                            (Theme.of(context).platform == TargetPlatform.iOS
                                ? 0.335
                                : 0.355)),
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: defaultBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28),
                        topLeft: Radius.circular(28),
                      ),
                    ),
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider<LoginBloc>(
                          create: (_) => LoginBloc(),
                        ),
                      ],
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            Text(Strings().getWelcomeText(),
                                style: titleStyle(
                                    fontFamily: boldFontFamily, fontSize: 32)),
                            Spacer(),
                            Text(Strings().getLoginTitle1(),
                                style: titleStyle(
                                    fontFamily: boldFontFamily, fontSize: 18)),
                            SizedBox(height: 10),
                            Text(Strings().getLoginTitle2(),
                                style: titleStyle(
                                    fontFamily: boldFontFamily, fontSize: 22)),
                            Spacer(),
                            button(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CheckMobileScreen()));
                            }, Strings().getSingInText(), isFilledColor: false),
                            SizedBox(height: 20),
                            button(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  // builder: (context) => MedicineForm()));
                                  builder: (context) => AddMedication()));
                                  // builder: (context) => SignupScreenStep1()));
                            }, Strings().getCreateAccountText(),
                                isFilledColor: true),
                            Spacer(),
                            Center(
                              child: Text(
                                Strings().getDiscoverApp(),
                                style: titleStyle().copyWith(
                                    decoration: TextDecoration.underline,
                                    fontFamily: mediumFontFamily,
                                    fontSize: 14),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
