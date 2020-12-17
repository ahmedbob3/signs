import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Screens/select_snooze_screen.dart';
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
        body: snoozeSelected
            ? SnoozeScreen(closeFunction: widget.closePopup)
            : Container(
                margin: EdgeInsets.symmetric(vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        widget.data.mName,
                        style: titleStyle(
                            fontFamily: boldFontFamily,
                            color: Color.fromRGBO(76, 99, 124, 1),
                            fontSize: 24),
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.data.mDuration,
                        style: titleStyle(
                            fontFamily: mediumFontFamily,
                            color: defaultBackgroundColor,
                            fontSize: 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.data.lessTime,
                        style: titleStyle(
                            fontFamily: boldFontFamily,
                            color: Color.fromRGBO(96, 96, 96, 1),
                            fontSize: 24),
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.data.mReminderNote,
                        style: titleStyle(
                            fontFamily: semiBoldFontFamily,
                            color: Color.fromRGBO(96, 96, 96, 1),
                            fontSize: 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.data.mReminderNote,
                        style: titleStyle(
                            fontFamily: semiBoldFontFamily,
                            color: Color.fromRGBO(96, 96, 96, 1),
                            fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: button(() {
                                setState(() {
                                  snoozeSelected = true;
                                });
                              }, 'Snooze',
                                  color: Color.fromRGBO(249, 201, 3, 1))),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 3,
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
}
