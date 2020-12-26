import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Screens/check_mobile_screen.dart';
import 'package:Signs/Screens/medication_reminder_scree.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Screens/medicine_add.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:intl/intl.dart';

class PillCell extends StatelessWidget {
  bool isNewPill;
  Datum data;

  PillCell({Key key, this.isNewPill, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data != null && data.rememberTime.length != 0)
      data.lessTime = DateFormat("hh:mm a")
          .format(DateFormat('kk:mm').parse(whichSooner(data.rememberTime)))
          .toString();
    return InkWell(
      onTap: () {
        if (data == null) {
          !isNewPill
              ? () {}
              : Constants.medications = [
                  false,
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddMedication()));
          return;
        }

        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (builder) {
            return StatefulBuilder(
                builder: (BuildContext context, setTheModalState) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(28),
                    topLeft: Radius.circular(28),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: MedicationReminderScreen(
                        data: data,
                        closePopup: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Positioned(
                      top: 3,
                      right: 1,
                      left: 1,
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 4))
                            ]),
                        child: Image.asset(Inhalator_active),
                      ),
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: isNewPill ? (MediaQuery.of(context).size.width * 0.88) : 220,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
            ]),
        child: Stack(
          children: <Widget>[
            Image.asset(Circle),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(!isNewPill ? data.mfImage : Add_pill,
                          height: 20, fit: BoxFit.contain),
                      !isNewPill
                          ? Text(
                              data.rememberTime.length != 0
                                  ? data.lessTime
                                  : "",
                              style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                fontSize: 14,
                                color: Color.fromRGBO(96, 96, 96, 1),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(height: 10),
                  !isNewPill
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.mName,
                              style: titleStyle(
                                  fontFamily: semiBoldFontFamily,
                                  fontSize: 19,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(data.mDose + " " + data.mfName,
                                    style: titleStyle(
                                      fontFamily: semiBoldFontFamily,
                                      fontSize: 16,
                                      color: Color.fromRGBO(96, 96, 96, 1),
                                    )),
                                Text(data.mDuration + " days",
                                    style: titleStyle(
                                      fontFamily: semiBoldFontFamily,
                                      fontSize: 14,
                                      color: Color.fromRGBO(96, 96, 96, 1),
                                    )),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Expanded(
                                child: Text('Add a reminder about a pill',
                                    style: titleStyle(
                                        fontFamily: semiBoldFontFamily,
                                        color: Colors.black54,
                                        fontSize: 18))),
                            GestureDetector(
                              onTap: () {
                                if (Singleton().loginModel == null) {
                                  showAlertDialog(context);
                                } else {
                                  !isNewPill
                                      ? () {}
                                      : Constants.medications = [
                                          false,
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AddMedication()));
                                }
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: defaultBackgroundColor,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(Strings().getSingInText()),
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CheckMobileScreen(isSignIn: true)));
      },
    );
    Widget continueButton = FlatButton(
      child: Text(Strings().getSignupStrings()),
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CheckMobileScreen(isSignIn: false)));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text(""),
      content: Text(Strings().getShouldLoggedInString()),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String whichSooner(List<String> rememberTime) {
    rememberTime.sort();
    return rememberTime.elementAt(0).toString();
  }
}
