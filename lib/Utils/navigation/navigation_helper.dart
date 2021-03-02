import 'package:Signs/ui/appointment/speciality/specialty_screen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

Route getApplicationRoute(RouteSettings settings) {
  switch (settings.name){
    case SpecialityScreen.tag:
      return _buildRoute(settings, SpecialityScreen());
    default:
      return null;
  }
}

PageRouteBuilder _buildRoute(RouteSettings settings, Widget page, {int transitionTime = 400, Offset transitionBegin = Offset.zero}){
  return new PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(milliseconds: transitionTime),
      pageBuilder: (BuildContext context, _, __) => page,
      transitionsBuilder: (_, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: transitionBegin,
              end: Offset.zero,
            ).animate(animation),
            child: child, // child is the value returned by pageBuilder
          ),
        );
      }
  );
}