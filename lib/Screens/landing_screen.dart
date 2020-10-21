import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'medication_screen.dart';


class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Constants.textDirection,
      child: WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(245, 248, 252, 1),
              child: Stack(
                children: <Widget>[
                  selectedTabIndex == 0 ? Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Login_background),
                          fit: BoxFit.cover),
                    ),
                  ) : Container(),
                  getCurrentScreen()
                ],
              ),
            )
          ),
          floatingActionButton: Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(top: 30),
            child: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Increment',
              child: Icon(Icons.add),
              elevation: 4.0,
              backgroundColor: defaultBackgroundColor,
            ),
          ),
          bottomNavigationBar: Container(
            child: Container(
              color: Color.fromRGBO(245, 248, 252, 1),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              selectedTabIndex = 0 ;
                            });
                          },
                      icon: Image.asset(selectedTabIndex == 0 ? Home_Active : Home_Inactive),
                      iconSize: 140,
                    )),
                    Expanded(
                        child: IconButton(
                      icon: Image.asset(
                        Appointement_inactive,
                      ),
                      iconSize: 140,
                    )),
                    Expanded(child: new Text('')),
                    Expanded(
                        child: IconButton(
                            icon: Image.asset(History_inctive), iconSize: 140)),
                    Expanded(
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = 3;
                              });
                            },
                            icon: Image.asset(selectedTabIndex == 3 ? Medicine_Active : Medicine_inctive ),
                            iconSize: 140)),
                  ],
                  // unselectedItemColor: Colors.grey,
                  // selectedItemColor: Colors.black,
                  // showUnselectedLabels: true,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  Widget getCurrentScreen(){
    switch (selectedTabIndex) {
      case 0:
        return HomeScreen();
        break;
      case 3:
        return MedicationScreen();
        break;
      default:
      return HomeScreen();
    }
  }
}
