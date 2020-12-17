import 'package:Signs/Screens/landing_screen.dart';
import 'package:Signs/Screens/medication_reminder_scree.dart';
import 'package:Signs/Screens/select_snooze_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Blocs/login%20mobile%20bloc/login_mobile_bloc.dart';

import 'package:Signs/Screens/check_mobile_screen.dart';
import 'package:Signs/Screens/login_screen.dart';
import 'package:Signs/Screens/signup_screen_step1.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';

import 'home_screen.dart';
import 'medicine_add.dart';
import 'medicine_form.dart';
import 'signup_sub_screen_step1.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool openSnoozeScree = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Constants.textDirection,
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
                                  builder: (context) => CheckMobileScreen(isSignIn: true,)));
                            }, Strings().getSingInText(), isFilledColor: false),
                            SizedBox(height: 20),
                            button(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  // builder: (context) => MedicineForm()));
                                  // builder: (context) => AddMedication()));
                                  // builder: (context) => SignupSubAccountScreenStep1()));
                                  builder: (context) =>
                                      CheckMobileScreen(isSignIn: false)));
                            }, Strings().getCreateAccountText(),
                                isFilledColor: true),
                            Spacer(),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LandingScreen()));
                              },
                              child: Center(
                                child: Text(
                                  Strings().getDiscoverApp(),
                                  style: titleStyle().copyWith(
                                      decoration: TextDecoration.underline,
                                      fontFamily: mediumFontFamily,
                                      fontSize: 14),
                                ),
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
