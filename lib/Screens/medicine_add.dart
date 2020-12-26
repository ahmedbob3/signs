import 'package:Signs/Blocs/medication%20bloc/medication_bloc.dart';
import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
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
  Datum _medicationData;
  bool isLoading = false;
  String timeForRemember = "";
  final formKey = GlobalKey<FormState>();
  // bool backFromAll=false;

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
    _medicationData = Datum();
  }

  _getRequests() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Constants.textDirection,
      child: Container(
        color: defaultBackgroundColor,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            appBar: AppBar(),
            key: _scaffoldKey,
            body: BlocBuilder<MedicationBloc, MedicationState>(
              bloc: _medicationBloc,
              builder: (context, state) {
                if (state is MedicationLoadingState) {
                  if (!isLoading) {
                    showLoadingDialog(context);
                    isLoading = true;
                  }
                } else if (state is MedicationLoadedState) {
                  print('loaded');

                  Future.delayed(Duration(milliseconds: 1), () {
                    if (state.medicationresponse.code != 200) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(state.medicationresponse.msg)));
                      Navigator.of(context).pop();
                    } else {
                      Constants.medicationList.add(_medicationData);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LandingScreen()));
                    }
                    _medicationBloc.add(resetMedicationState());
                    isLoading = false;
                  });
                }

                return new GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Container(
                    child: Form(
                      key: formKey,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height + 220,
                              padding: EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 5),
                              child: new Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  new Text(
                                    Strings().getMedicineAddStrings(),
                                    style: titleStyle(
                                        fontFamily: boldFontFamily,
                                        color: defaultBackgroundColor,
                                        fontSize: 24),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, left: 15),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: TextField(
                                                  controller: _nameController,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'ibuprofen , 200 mg',
                                                    hintStyle: titleStyle(
                                                        fontFamily:
                                                            mediumFontFamily,
                                                        color: greyColor,
                                                        fontSize: 16),
                                                    labelStyle: titleStyle(
                                                        color: greyColor),
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  } // Move focus to next
                                                  ),
                                            ),
                                          ),
                                          // IconButton(
                                          //   icon: Image.asset(
                                          //     Camera_rectangle,
                                          //     fit: BoxFit.fitHeight,
                                          //   ),
                                          //   onPressed: () {
                                          //     Navigator.of(context).pop();
                                          //   },
                                          // ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240),
                                      new GestureDetector(
                                        onTap: () {
                                          // backFromAll=true;
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             MedicineForm()));
                                          Navigator.of(context)
                                              .push(
                                                new MaterialPageRoute(
                                                    builder: (_) =>
                                                        MedicineForm()),
                                              )
                                              .then((val) =>
                                                  val ? _getRequests() : null);
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
                                  SizedBox(height: 20),
                                  Text(
                                      getid(Constants.medications) != -1
                                          ? mfNameValues.mapString[
                                              getid(Constants.medications)
                                                  .toString()]
                                          : Strings().getDropsStrings(),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Image.asset(
                                              Minus_rectangle,
                                              fit: BoxFit.fill,
                                            ),
                                            onPressed: () {
                                              if (int.parse(_numberController
                                                      .text
                                                      .toString()) >
                                                  0)
                                                _numberController.text =
                                                    (int.parse(_numberController
                                                                .text
                                                                .toString()) -
                                                            1)
                                                        .toString();
                                            },
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: TextField(
                                                  controller: _numberController,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: '2',
                                                    hintStyle: titleStyle(
                                                        fontFamily:
                                                            mediumFontFamily,
                                                        color: greyColor,
                                                        fontSize: 16),
                                                    labelStyle: titleStyle(
                                                        color: greyColor),
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  } // Move focus to next
                                                  ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Image.asset(
                                              Plus_rectangle,
                                              fit: BoxFit.fill,
                                            ),
                                            onPressed: () {
                                              if (int.parse(_numberController
                                                      .text
                                                      .toString()) <=
                                                  30)
                                                _numberController.text =
                                                    (int.parse(_numberController
                                                                .text
                                                                .toString()) +
                                                            1)
                                                        .toString();
                                            },
                                          ),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Image.asset(
                                              Medicine_notification,
                                              fit: BoxFit.fill,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: TextField(
                                                controller: _timeController,
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  hintText: '10 : 00 AM',
                                                  hintStyle: titleStyle(
                                                      fontFamily:
                                                          mediumFontFamily,
                                                      color: greyColor,
                                                      fontSize: 16),
                                                  labelStyle: titleStyle(
                                                      color: greyColor),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                // keyboardType: TextInputType.number,
                                                textInputAction:
                                                    TextInputAction.next,
                                                onEditingComplete: () {
                                                  FocusScope.of(context)
                                                      .nextFocus();
                                                }, // Move focus to next
                                                onTap: () {
                                                  DatePicker.showTime12hPicker(
                                                      context,
                                                      showTitleActions: true,
                                                      onChanged: (date) {
                                                    _timeController.text =
                                                        (DateFormat('hh:mm a')
                                                            .format(date)
                                                            .toString());
                                                    print(
                                                        'change $date in time zone ' +
                                                            date.timeZoneOffset
                                                                .inHours
                                                                .toString());
                                                  }, onConfirm: (date) {
                                                    _timeController.text =
                                                        (DateFormat('hh:mm a')
                                                            .format(date)
                                                            .toString());
                                                    Constants.signUpData
                                                        .setWakeupTime(
                                                            DateFormat('kk:mm')
                                                                .format(date)
                                                                .toString());
                                                  },
                                                      currentTime:
                                                          DateTime.now());
                                                },
                                              ),
                                            ),
                                          ),
                                          IconButton(
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
                                                    (DateFormat('hh:mm a')
                                                        .format(date)
                                                        .toString());
                                                print(
                                                    'change $date in time zone ' +
                                                        date.timeZoneOffset
                                                            .inHours
                                                            .toString());
                                              }, onConfirm: (date) {
                                                _timeController.text =
                                                    (DateFormat('hh:mm a')
                                                        .format(date)
                                                        .toString());
                                                timeForRemember =
                                                    (DateFormat('kk:mm')
                                                        .format(date)
                                                        .toString());
                                                _onSubmit(_timeController.text
                                                    .toString());
                                                Constants.signUpData
                                                    .setWakeupTime(
                                                        DateFormat('kk:mm')
                                                            .format(date)
                                                            .toString());
                                              }, currentTime: DateTime.now());
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  _listViewData.length > 0
                                      ? AddRemoveListView()
                                      : Container(),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: TextField(
                                                  controller:
                                                      _durationController,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: '20 days',
                                                    hintStyle: titleStyle(
                                                        fontFamily:
                                                            mediumFontFamily,
                                                        color: greyColor,
                                                        fontSize: 16),
                                                    labelStyle: titleStyle(
                                                        color: greyColor),
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  } // Move focus to next
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
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
                                                        fontFamily:
                                                            mediumFontFamily,
                                                        color: greyColor,
                                                        fontSize: 16),
                                                    labelStyle: titleStyle(
                                                        color: greyColor),
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  }, // Move focus to next
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
                                    if (_timeController.text.toString().isNotEmpty &&
                                        _nameController.text
                                            .toString()
                                            .isNotEmpty &&
                                        _durationController.text
                                            .toString()
                                            .isNotEmpty &&
                                        _noteController.text
                                            .toString()
                                            .isNotEmpty &&
                                        _numberController.text
                                            .toString()
                                            .isNotEmpty) {
                                      _medicationData.isActive = "1";
                                      _medicationBloc.add(doMedicationEvent(
                                          Singleton()
                                              .loginModel
                                              .data
                                              .uId
                                              .toString(),
                                          _nameController.text.toString(),
                                          getid(Constants.medications)
                                              .toString(),
                                          _numberController.text.toString(),
                                          _durationController.text.toString(),
                                          _noteController.text.toString(),
                                          getReminderData(_listViewData)));
                                    } else {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text(Strings().getFillDataString()),
                                        duration: Duration(seconds: 3),
                                      ));
                                    }
                                  }, Strings().getDoneStrings(),
                                      isFilledColor: true),
                                  Spacer()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget medicationForm(int index) {
    // if(backFromAll==true)
    // index= getid(Constants.medications);
    // backFromAll=false;
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
                      ? cardChangeState(true, Capsule_active, Capsule_inactive,
                          Strings().getCapsuleStrings(),
                          isFActive: Constants.medications[0])
                      : index == 1
                          ? cardChangeState(true, Tablet_active,
                              Tablet_inactive, Strings().getTabletStrings(),
                              isFActive: Constants.medications[1])
                          : index == 2
                              ? cardChangeState(true, Liquid_active,
                                  Liquid_inactive, Strings().getLiquidStrings(),
                                  isFActive: Constants.medications[2])
                              : index == 3
                                  ? cardChangeState(
                                      true,
                                      Drops_Active,
                                      Drops_inactive,
                                      Strings().getDropsStrings(),
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
    int result = -1;
    for (int i = 0; i < medications.length - 1; i++) {
      if (medications[i] == true) result = i + 1;
    }
    return result;
  }

  List<String> _listViewData = [];

  _onSubmit(String data) {
    setState(() {
      _listViewData.add(data);
    });
  }

  AddRemoveListView() {
    return Container(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _listViewData.length,
          itemBuilder: (context, index) {
            return medicationAlarm(index);
          }),
    );
  }

  medicationAlarm(int index) {
    return Container(
      width: 120,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 120,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _listViewData.remove(_listViewData[index]);
                    });
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        SizedBox(height: 20),
                        Text(
                          _listViewData[index],
                          style: TextStyle(
                              color: headerColor,
                              fontSize: 16,
                              fontFamily: mediumFontFamily),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  final mfNameValues = EnumValues({
    "1": Strings().getCapsuleStrings(),
    "2": Strings().getTabletStrings(),
    "3": Strings().getLiquidStrings(),
    "4": Strings().getDropsStrings(),
    "5": Strings().getSuppositoryStrings(),
    "6": Strings().getTopicalStrings(),
    "7": Strings().getSachetsStrings(),
    "8": Strings().getInhalersStrings(),
    "9": Strings().getImplantsStrings(),
    "10": Strings().getPatchesStrings(),
    "11": Strings().getInjectionsStrings()
  });

  String getReminderData(List<String> listViewData) {
    String result = "[";
    for (int i = 0; i < listViewData.length; i++) {
      if (i == listViewData.length - 1)
        result = result +
            '"' +
            DateFormat('kk:mm')
                .format(DateFormat('hh:mm a').parse(listViewData[i])) +
            '"' +
            "]";
      else
        result = result +
            '"' +
            DateFormat('kk:mm')
                .format(DateFormat('hh:mm a').parse(listViewData[i])) +
            '"' +
            ",";
    }
    return result;
  }
}

class EnumValues<T> {
  Map<String, T> mapString;
  Map<T, String> reverseMap;

  EnumValues(this.mapString);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = mapString.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
