import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Screens/select_snooze_screen.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:flutter/material.dart';


class MedicationReminderScreen extends StatefulWidget {
  final Function openSnoozeScreen;
  final Function closePopup;
  final Datum data;
  const MedicationReminderScreen(
      {Key key, this.openSnoozeScreen, this.closePopup, this.data})
      : super(key: key);

  @override
  _MedicationReminderScreenState createState() =>
      _MedicationReminderScreenState();
}

class _MedicationReminderScreenState extends State<MedicationReminderScreen> {
  bool snoozeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: snoozeSelected
            ? SnoozeScreen(closeFunction: widget.closePopup, data: widget.data)
            : Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                // margin: EdgeInsets.symmetric(vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Skip',
                            style: titleStyle(
                                color: Color.fromRGBO(76, 99, 124, 1),
                                fontFamily: boldFontFamily,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: Text(
                        widget.data.mName,
                        style: titleStyle(
                            fontFamily: boldFontFamily,
                            color: Color.fromRGBO(76, 99, 124, 1),
                            fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        Strings().getDAYText() +
                            ' ' +
                            getRemaningDays(widget.data.createdDatetime) +
                            ' ' +
                            Strings().getReminderText(),
                        style: titleStyle(
                            fontFamily: mediumFontFamily,
                            color: defaultBackgroundColor,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        widget.data.lessTime,
                        style: titleStyle(
                            fontFamily: boldFontFamily,
                            color: Color.fromRGBO(96, 96, 96, 1),
                            fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: Text(
                        Strings().getTakeext() +
                            ' ' +
                            widget.data.mDose +
                            " " +
                            widget.data.mfName,
                        style: titleStyle(
                            fontFamily: semiBoldFontFamily,
                            color: Color.fromRGBO(96, 96, 96, 1),
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: Text(
                        widget.data.mReminderNote,
                        style: titleStyle(
                            fontFamily: semiBoldFontFamily,
                            color: Color.fromRGBO(96, 96, 96, 1),
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: button(() {
                                setState(() {
                                  snoozeSelected = true;
                                });
                              }, 'Snooze',
                                  color: Color.fromRGBO(249, 201, 3, 1))),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: button(() {
                              widget.closePopup();
                            }, 'Take'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }

  String getRemaningDays(String createdDatetime) {
    final createDate = DateTime.parse(createdDatetime);
    final currentDate = DateTime.now();
    return (currentDate.difference(createDate).inDays+1).toString();

  }
}
