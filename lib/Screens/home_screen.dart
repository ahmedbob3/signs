import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Blocs/home%20bloc/home_bloc.dart';
import 'package:Signs/Medication%20bloc/medication_bloc.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Screens/medication_section.dart';
import 'package:Signs/Screens/signup_sub_screen_step1.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/hospital_cell.dart';
import 'package:Signs/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc;
  List<MedicationBloc> medicationList = [];
  HospitalsModel _hospitalsModel;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc = HomeBloc();
    _homeBloc.add(loadMedicationsEvent());
    _homeBloc.add(getHospitalsEvent());
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
                if (!isLoading) {
                  showLoadingDialog(context);
                  isLoading = true;
                }
              } else if (state is HomeLoadedState) {
                medicationList = state.medicationList;
                Future.delayed(Duration(milliseconds: 1000), () {
                  if (isLoading) {
                    _homeBloc.add(resetHomeEvent());
                    Navigator.of(context).pop();
                    isLoading = false;
                  }
                });
              } else if (state is HospitalsLoadedState) {
                _hospitalsModel = state.hospitalsModel;
                Future.delayed(Duration(milliseconds: 1000), () {
                  if (isLoading) {
                    _homeBloc.add(resetHomeEvent());
                    Navigator.of(context).pop();
                    isLoading = false;
                  }
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      SignupSubAccountScreenStep1()));
                            });
                          },
                          child: CircleAvatar(
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

                    SizedBox(height: 80),
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
                        itemCount: _hospitalsModel?.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return HospitalCell(_hospitalsModel.data[index]);
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
