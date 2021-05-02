import 'package:Signs/Utils/navigation/navigation_helper.dart';
import 'package:Signs/Utils/services/localization_service.dart';
import 'package:Signs/Utils/services/shared_preferences_service.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Screens/splash_screen.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Blocs/login mobile bloc/login_mobile_bloc.dart';
import 'Utils/constants.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializeDateFormatting();
  await CountryCodes.init();
  await Get.putAsync(() => SharedPreferencesService.init(), permanent: true);
  Get.put(LocalizationService.init(), permanent: true);
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
    return ScreenUtilInit(
      designSize: Size(411, 877),
      allowFontScaling: true,
      builder:()=> GetMaterialApp(
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
        localizationsDelegates: [
          // 1
          S.delegate,
          // 2
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Get.find<LocalizationService>().currentLocale.locale,
      ),
    );
  }
}
