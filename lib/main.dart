import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Screens/splash_screen.dart';
import 'package:Signs/Utils/styles.dart';
import 'Blocs/login mobile bloc/login_mobile_bloc.dart';
import 'Utils/constants.dart';
import 'package:Signs/utils/navigation/navigation_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CountryCodes.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: defaultBackgroundColor,
      systemNavigationBarColor: defaultBackgroundColor, // navigation bar color
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Font-Regular',
          // backgroundColor: defaultBackgroundColor,
          // canvasColor: defaultBackgroundColor,
          //  theme: ThemeData(canvasColor: Colors.transparent)
          primaryColor: defaultBackgroundColor,
          // scaffoldBackgroundColor: defaultBackgroundColor,
        ),
        home: BlocProvider(
          create: (context) => LoginBloc(),
          child: Directionality(
            textDirection: Constants.textDirection,
            child: SplashScreen(),
          ),
        ),
      onGenerateRoute: getApplicationRoute,
    );
  }
}
