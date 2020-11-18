import 'package:Signs/Blocs/home%20bloc/home_bloc.dart';
import 'package:Signs/Blocs/medication%20bloc/medication_bloc.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Screens/signup_screen_step2.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'home_screen.dart';
import 'landing_screen.dart';
import 'medicine_form.dart';

class AddMedication extends StatefulWidget {
  AddMedication({Key key}) : super(key: key);

  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  bool isActive = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _numberController = TextEditingController(text: '0');
  TextEditingController _noteController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  MedicationBloc _medicationBloc;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _timeController.dispose();
    _numberController.dispose();
    _noteController.dispose();
    _durationController.dispose();

  }

  @override
  void initState() {
    super.initState();
    _medicationBloc = MedicationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: _scaffoldKey,
          body: BlocBuilder<MedicationBloc, MedicationState>(
          bloc: _medicationBloc,
          builder: (context, state) {

            if (state is MedicationLoadingState) {
              if (!isLoading) {
                showLoadingDialog(context);
                isLoading = true;
              }
            }
            else if (state is MedicationLoadedState) {
              print('loaded');

              Future.delayed(Duration(milliseconds: 1), () {
                if (state.medicationresponse.code != 200) {
                  Constants.medicationList.add(_medicationBloc);
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text(state.medicationresponse.msg)));
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomeScreen()));
                }
                _medicationBloc.add(resetMedicationState());
                isLoading = false;
              });
            }


          return Container(
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: Colors.white,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height + 200,
                    // margin: EdgeInsets.only(
                    //     top: (Theme.of(context).platform == TargetPlatform.iOS
                    //         ? 120
                    //         : 10)),
                    padding:
                    EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Positioned(

                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:  Image.asset(
                                  Arrow_back_grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Positioned(
                                child: Text(
                                  Strings().getMedicineAddStrings(),
                                  style: titleStyle(
                                      fontFamily: boldFontFamily,
                                      color: defaultBackgroundColor,
                                      fontSize: 24),
                                ),
                                ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(Strings().getMedicationNameStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyColor,
                                fontSize: 17)),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0, left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        hintText: 'ibuprofen , 200 mg',
                                        hintStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: greyColor,
                                            fontSize: 16),
                                        labelStyle:
                                            titleStyle(color: greyColor),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    child: IconButton(
                                      icon: Image.asset(
                                        Camera_rectangle,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    left: 30),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text(Strings().getMedicineStrings(),
                                style: titleStyle(
                                    fontFamily: semiBoldFontFamily,
                                    color: greyColor,
                                    fontSize: 17)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 240),
                            new GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MedicineForm()));
                              },
                              child: Text(
                                "View more",
                                style: titleStyle(
                                    fontFamily: boldFontFamily,
                                    color: defaultBackgroundColor,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                    // Container(
                    // ),

                      Container(
                          width: double.infinity,
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return medicationForm(index);
                              }),
                        ),
                        SizedBox(height: 10),
                        Text(Strings().getDropsStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyColor,
                                fontSize: 17)),
                        Text(Strings().getMedicationHowStrings(),
                            style: titleStyle(
                                fontFamily: mediumFontFamily,
                                color: greyColor,
                                fontSize: 14)),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Row(
                              children: <Widget>[
                                Positioned(
                                    child: IconButton(
                                      icon: Image.asset(
                                        Minus_rectangle,
                                        fit: BoxFit.fill,
                                      ),
                                      onPressed: () {
                                        if(int.parse(_numberController.text.toString()) >0)
                                        _numberController.text = (int.parse(_numberController.text.toString()) - 1).toString() ;
                                      },
                                    ),
                                    right: 50),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      controller: _numberController,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: '2',
                                        hintStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: greyColor,
                                            fontSize: 16),
                                        labelStyle:
                                            titleStyle(color: greyColor),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    child: IconButton(
                                      icon: Image.asset(
                                        Plus_rectangle,
                                        fit: BoxFit.fill,
                                      ),
                                      onPressed: () {
                                        if(int.parse(_numberController.text.toString()) <=30)
                                          _numberController.text = (int.parse(_numberController.text.toString()) + 1).toString() ;
                                      },
                                    ),
                                    left: 50),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getMedicationReminderStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyColor,
                                fontSize: 17)),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Row(
                              children: <Widget>[
                                Positioned(
                                    child: IconButton(
                                      icon: Image.asset(
                                        Medicine_notification,
                                        fit: BoxFit.fill,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    right: 50),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      controller: _timeController,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: '10 : 00 AM',
                                        hintStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: greyColor,
                                            fontSize: 16),
                                        labelStyle:
                                            titleStyle(color: greyColor),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      // keyboardType: TextInputType.number,
                                      onTap: () {
                                        DatePicker.showTime12hPicker(
                                            context,
                                            showTitleActions: true,
                                            onChanged: (date) {
                                              _timeController.text =
                                              (DateFormat('kk:mm a')
                                                  .format(date)
                                                  .toString());
                                              print(
                                                  'change $date in time zone ' +
                                                      date.timeZoneOffset
                                                          .inHours
                                                          .toString());
                                            }, onConfirm: (date) {
                                          _timeController.text =
                                          (DateFormat('kk:mm a')
                                              .format(date)
                                              .toString());
                                          Constants.signUpData
                                              .setWakeupTime(
                                              DateFormat('kk:mm')
                                                  .format(date)
                                                  .toString());
                                        }, currentTime: DateTime.now());
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                    child: IconButton(
                                      icon: Image.asset(
                                        Plus_rectangle,
                                        fit: BoxFit.fill,
                                      ),
                                      onPressed: () {
                                        DatePicker.showTime12hPicker(
                                            context,
                                            showTitleActions: true,
                                            onChanged: (date) {
                                              _timeController.text =
                                              (DateFormat('kk:mm a')
                                                  .format(date)
                                                  .toString());
                                              print(
                                                  'change $date in time zone ' +
                                                      date.timeZoneOffset
                                                          .inHours
                                                          .toString());
                                            }, onConfirm: (date) {
                                          _timeController.text =
                                          (DateFormat('kk:mm a')
                                              .format(date)
                                              .toString());
                                          Constants.signUpData
                                              .setWakeupTime(
                                              DateFormat('kk:mm')
                                                  .format(date)
                                                  .toString());
                                        }, currentTime: DateTime.now());
                                      },
                                    ),
                                    left: 50),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getMedicationDurationStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyColor,
                                fontSize: 17)),
                        Text(Strings().getMedicationHowLongStrings(),
                            style: titleStyle(
                                fontFamily: mediumFontFamily,
                                color: greyColor,
                                fontSize: 14)),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      controller: _durationController,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: '20 days',
                                        hintStyle: titleStyle(
                                            fontFamily: mediumFontFamily,
                                            color: greyColor,
                                            fontSize: 16),
                                        labelStyle:
                                            titleStyle(color: greyColor),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getMedicationNoteStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyColor,
                                fontSize: 17)),
                        SizedBox(height: 10),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                        controller: _noteController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText:
                                              'ex: That’s my painkiller to my teeth',
                                          hintStyle: titleStyle(
                                              fontFamily: mediumFontFamily,
                                              color: greyColor,
                                              fontSize: 16),
                                          labelStyle:
                                              titleStyle(color: greyColor),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        minLines: 3,
                                        maxLines: null),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        button(() {

                          if(_timeController.text.toString().isNotEmpty && _nameController.text.toString().isNotEmpty && _durationController.text.toString().isNotEmpty && _noteController.text.toString().isNotEmpty && _numberController.text.toString().isNotEmpty){
                            _medicationBloc.add(doMedicationEvent(
                                 (Constants.medicationList.length+1).toString(),
                                _nameController.text.toString(),
                                getid(Constants.medications).toString(),
                                _numberController.text.toString(),
                                _durationController.text.toString(),
                                _noteController.text.toString(),
                                _timeController.text.toString()
                            ));
                          }
                          else{
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(Strings().getFillDataString()),
                                  duration: Duration(seconds: 3),
                                ));
                          }

                        }, Strings().getDoneStrings(), isFilledColor: true),
                        Spacer()
                      ],
                    ),
                  // ),
                ),
                // Positioned(
                //     child: IconButton(
                //       icon: Icon(
                //         Icons.arrow_back_ios,
                //         color: Color.fromRGBO(130, 130, 130, 1),
                //       ),
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //       },
                //     ),
                //     top: 5,
                //     left: 5),
                // Positioned(
                //     child: Text(
                //       Strings().getMedicineAddStrings(),
                //       style: titleStyle(
                //           fontFamily: boldFontFamily,
                //           color: defaultBackgroundColor,
                //           fontSize: 24),
                //     ),
                //     top: 60,
                //     left: 30),
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

  Widget medicationForm(int index) {
    return Container(
      width: 120,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      switch (index) {
                        case 0:
                          isActive = !Constants.medications[0];
                          Constants.medications = [
                            isActive,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false
                          ];
                          break;
                        case 1:
                          isActive = !Constants.medications[1];
                          Constants.medications = [
                            false,
                            isActive,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false
                          ];
                          break;
                        case 2:
                          isActive = !Constants.medications[2];
                          Constants.medications = [
                            false,
                            false,
                            isActive,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false
                          ];
                          break;
                        case 3:
                          isActive = !Constants.medications[3];
                          Constants.medications = [
                            false,
                            false,
                            false,
                            isActive,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false
                          ];
                          break;
                        case 4:
                          isActive = !Constants.medications[4];
                          Constants.medications = [
                            false,
                            false,
                            false,
                            false,
                            isActive,
                            false,
                            false,
                            false,
                            false,
                            false,
                            false
                          ];
                          break;
                      }
                    });
                  },
                  child: index == 0
                      ? cardChangeState(true, Tablet_active, Tablet_inactive, Strings().getTabletStrings(),
                          isFActive: Constants.medications[0])
                      : index == 1
                          ? cardChangeState(
                              true, Capsule_active, Capsule_inactive, Strings().getCapsuleStrings(),
                              isFActive: Constants.medications[1])
                          : index == 2
                              ? cardChangeState(
                                  true, Liquid_active, Liquid_inactive, Strings().getLiquidStrings(),
                                  isFActive: Constants.medications[2])
                              : index == 3
                                  ? cardChangeState(
                                      true, Drops_Active, Drops_inactive, Strings().getDropsStrings(),
                                      isFActive: Constants.medications[3])
                                  : index == 4
                                      ? cardChangeState(
                                          true,
                                          Suppository_active,
                                          Suppository_inactive,
                                          Strings().getSuppositoryStrings(),
                                          isFActive: Constants.medications[4])
                                      : Container(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getid(List<bool> medications) {
    int result=0;
    for (int i=0;i<medications.length -1;i++){
      if(medications[i]== true)
        result=i+1;
    }
    return result;
  }
}
