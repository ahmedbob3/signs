import 'package:Signs/Blocs/medication%20bloc/medication_bloc.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Blocs/home%20bloc/home_bloc.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Screens/medication_section.dart';
import 'package:Signs/Screens/signup_sub_screen_step1.dart';
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

  HospitalsModel _hospitalsModel;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

if(_homeBloc ==null ){
      _homeBloc = HomeBloc();
    _homeBloc.add(loadMedicationsEvent());
    _homeBloc.add(getSubaccountsEvent());
    _homeBloc.add(getHospitalsEvent());

}
  
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        bottom: false,
        child: BlocBuilder(
          bloc: _homeBloc,
          builder: (context, state) {
            if (state is HomeLoadingState) {
              if (!isLoading) {
                showLoadingDialog(context);
                isLoading = true;
              }
            } else if (state is HomeLoadedState) {
              if (state.medicationModel != null)
                Constants.medicationList = state.medicationModel.data;
              if (state.subaccountsModel != null)
                Constants.subaccountsList = state.subaccountsModel.data;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  Singleton().loginModel.data.uFirstName +
                                      ' ' +
                                      Singleton().loginModel.data.uLastName,
                                  style: titleStyle(
                                      fontFamily: boldFontFamily, fontSize: 20),
                                ),
                              ),
                              Icon(Icons.search, color: Colors.white, size: 30),
                              SizedBox(width: 20),
                              Icon(Icons.notifications,
                                  color: Colors.white, size: 30),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // subaccounts ..
                        Constants.subaccountsList.length == 0 ||
                                Constants.subaccountsList == null
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Align(
                                    child: addSubAccount(),
                                    alignment: Alignment.centerLeft),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                height: 50,
                                child: ListView.builder(
                                  itemCount:
                                      Constants.subaccountsList.length + 1,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return index == 0
                                        ? addSubAccount()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: CircleAvatar(
                                              radius: 24,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                radius: 22,
                                                backgroundColor: Color.fromRGBO(
                                                    0, 54, 115, 1),
                                                child: Text(
                                                  (Constants
                                                          .subaccountsList[
                                                              index - 1]
                                                          .saFirstName != null ? Constants
                                                          .subaccountsList[
                                                              index - 1]
                                                          .saFirstName[0]
                                                          .toUpperCase() :
                                                      '' )+
                                                      (Constants
                                                          .subaccountsList[
                                                              index - 1]
                                                          .saLastName != null ? Constants
                                                          .subaccountsList[
                                                              index - 1]
                                                          .saLastName[0]
                                                          .toUpperCase() : ''),
                                                  style: titleStyle(
                                                      fontFamily:
                                                          boldFontFamily,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // Upcoming reminder ..
                  Expanded(
                    flex: 1,
                    child: MediciationSection(
                      medicationList: Constants.medicationList,
                    ),
                  ),
                  // hospitals list ..
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(Strings().getRemindersStrings(),
                                style: titleStyle(
                                    fontFamily: boldFontFamily,
                                    fontSize: 22,
                                    color: defaultBackgroundColor)),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              height: 480,
                              child: ListView.builder(
                                itemCount: _hospitalsModel?.data?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return HospitalCell(
                                      _hospitalsModel.data[index]);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  addSubAccount() {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignupSubAccountScreenStep1()));
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
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
    );
  }
}
