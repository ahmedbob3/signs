import 'package:Signs/Utils/navigation/navigation_helper.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Screens/splash_screen.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Blocs/login mobile bloc/login_mobile_bloc.dart';
import 'Utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
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
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: BlocProvider(
          create: (context) => LoginBloc(),
          child: Directionality(
            textDirection: Constants.textDirection,
            child: SplashScreen(),
          ),
        ),
      getPages: applicationPages,
    );
  }
}
