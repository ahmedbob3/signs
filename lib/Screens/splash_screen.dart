import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Signs/Screens/langauage_screen.dart';
import 'package:Signs/Screens/welcome_screen.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:Signs/Blocs/login%20mobile%20bloc/login_mobile_bloc.dart';
import 'landing_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginBloc _loginBloc;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
    checkForLanguage();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }

  checkForLanguage() async {
    _prefs.then((SharedPreferences prefs) async {
      // prefs.clear();
      Constants.languageId =
          languages.values[prefs.getInt('selectedLanguage') ?? 0];
      Constants.updateTextDirection();
      await new Future.delayed(const Duration(seconds: 2), () {
        if (prefs.getString('mobileNumber') == null || prefs.getString('mobileNumber').isEmpty) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => prefs.getInt('selectedLanguage') == null
                  ? LangauageScreen()
                  : WelcomeScreen()));
        } else {
          _loginBloc.add(doLoginEvent(
              prefs.getString('mobileNumber'), prefs.getString('password')));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        child: BlocBuilder<LoginBloc, LoginState>(
            bloc: _loginBloc,
            builder: (context, state) {
              if (state is LoginLoadingState) {
                if (!isLoading) {
                  showLoadingDialog(context);
                  isLoading = true;
                }
              } else if (state is LoginLoadedState) {
                Future.delayed(Duration(milliseconds: 1), () {
                  print(state.loginResponse.code);
                  if (state.loginResponse.code == 200) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LandingScreen(),
                      ),
                    );
                  }
                  //_loginBloc.add(resetState());
                  isLoading = false;
                });
              } 
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(SplashBG), fit: BoxFit.cover),
                ),
                child: Center(
                  child: Image.asset(SignsLogo),
                ),
              );
            }),
      ),
    );
    //     child: Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(image: AssetImage(SplashBG), fit: BoxFit.cover),
    //   ),
    //   child: Center(
    //     child: Image.asset(SignsLogo),
    //   ),
    // ),
  }
}
