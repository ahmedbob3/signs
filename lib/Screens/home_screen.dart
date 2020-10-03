import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signs/Blocs/home%20bloc/home_bloc.dart';
import 'package:signs/Blocs/navigation%20bloc/navigation_bloc.dart';
import 'package:signs/Screens/medication_section.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/hospital_cell.dart';
import 'package:signs/widgets/pill_cell.dart';
import 'package:signs/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc;
  List<String> medicationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc = HomeBloc();
    _homeBloc.add(loadMedicationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: BlocBuilder(
            bloc: _homeBloc,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                showLoadingDialog(context);
              } else if (state is HomeLoadedState) {
                medicationList = state.medicationList;
                Future.delayed(Duration(milliseconds: 1), () {
                  Navigator.of(context).pop();
                  _homeBloc.add(resetHomeEvent());
                });
              }

              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Hi Henrietta',
                                  style: titleStyle(
                                      fontFamily: boldFontFamily,
                                      fontSize: 20)),
                              SizedBox(height: 10),
                              Text('Nina’s Profile',
                                  style: titleStyle(
                                      fontFamily: mediumFontFamily,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                        Icon(Icons.search, color: Colors.white, size: 30),
                        SizedBox(width: 20),
                        Icon(Icons.notifications,
                            color: Colors.white, size: 30),
                      ],
                    ),
                    SizedBox(height: 20),
                    // subaccounts ..
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Color.fromRGBO(0, 54, 115, 1),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Color.fromRGBO(0, 54, 115, 1),
                            child: Text('NH',
                                style: titleStyle(
                                    fontFamily: boldFontFamily, fontSize: 18)),
                          ),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white70,
                          child: Text('ML',
                              style: titleStyle(
                                  fontFamily: boldFontFamily,
                                  fontSize: 18,
                                  color: Color.fromRGBO(163, 172, 194, 1))),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    // health title
                    Text(
                      'How is your Health ?',
                      style:
                          titleStyle(fontFamily: boldFontFamily, fontSize: 19),
                    ),
                    SizedBox(height: 20),
                    // health details ..
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Blood pressure',
                                        style: titleStyle(
                                            fontFamily: mediumFontFamily)),
                                    SizedBox(height: 10),
                                    Text('120/70',
                                        style: titleStyle(
                                            fontFamily: boldFontFamily,
                                            fontSize: 18)),
                                    SizedBox(height: 10),
                                    Text('Normal',
                                        style: titleStyle(
                                            fontFamily: semiBoldFontFamily)),
                                  ],
                                ),
                              ),
                              Image.asset(Blood_Pressure)
                            ],
                          ),
                        )),
                        SizedBox(width: 10),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(233, 178, 9, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Heart Rate',
                                        style: titleStyle(
                                            fontFamily: mediumFontFamily)),
                                    SizedBox(height: 10),
                                    Text('120 bpm',
                                        style: titleStyle(
                                            fontFamily: boldFontFamily,
                                            fontSize: 18)),
                                    SizedBox(height: 10),
                                    Text('Normal',
                                        style: titleStyle(
                                            fontFamily: semiBoldFontFamily)),
                                  ],
                                ),
                              ),
                              Image.asset(Heartbeat)
                            ],
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: 20),
                    // Upcoming reminder ..
                    MediciationSection(
                      medicationList: medicationList,
                    ),
                    // hospitals list ..
                    Text('Hospitals',
                        style: titleStyle(
                            fontFamily: boldFontFamily,
                            fontSize: 22,
                            color: defaultBackgroundColor)),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return HospitalCell();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
