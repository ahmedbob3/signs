import 'package:flutter/material.dart';
import 'package:signs/Screens/home_screen.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/widgets/widgets.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(245, 248, 252, 1),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Login_background),
                          fit: BoxFit.cover),
                    ),
                  ),
                  HomeScreen()
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(top: 40),
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 4.0,
        ),
      ),
      bottomNavigationBar: Container(
        child: Container(
          color: Color.fromRGBO(245	,248,	252,1),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [BoxShadow(
                color: Colors.grey[300],
                spreadRadius: 2,
                blurRadius: 10
              )]
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(icon: Icon(Icons.home)),
                ),
                Expanded(
                  child: IconButton(icon: Icon(Icons.show_chart)),
                ),
                Expanded(child: new Text('')),
                Expanded(
                  child: IconButton(icon: Icon(Icons.tab)),
                ),
                Expanded(
                  child: IconButton(icon: Icon(Icons.settings)),
                ),
              ],
              // unselectedItemColor: Colors.grey,
              // selectedItemColor: Colors.black,
              // showUnselectedLabels: true,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
