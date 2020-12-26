import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Notifications/NotificationPlugin.dart';
import 'package:Signs/Screens/medication_reminder_scree.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';


class SnoozeScreen extends StatefulWidget {
  final Function closeFunction;
  final Datum data;
  const SnoozeScreen({Key key, this.closeFunction,this.data}) : super(key: key);

  @override
  _SnoozeScreenState createState() => _SnoozeScreenState();
}

class _SnoozeScreenState extends State<SnoozeScreen> {
  List<String> timeStrings = ['30 Mins', '1 Hours', '2 Hours', '3 Hours'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  Strings().getSelectSnoozeLabel(),
                  style: titleStyle(
                      fontFamily: boldFontFamily,
                      fontSize: 20,
                      color: Color.fromRGBO(76, 99, 124, 1)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Text(
                  Strings().getSnoozeForLabel(),
                  style: titleStyle(
                      color: defaultBackgroundColor,
                      fontFamily: mediumFontFamily,
                      fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: ListTile(
                  leading: Image.asset('assets/images/ic_clock.png', width: 25),
                  title: Text('30 ${Strings().getMinsLabel()}',
                      style: titleStyle(
                          fontFamily: mediumFontFamily,
                          color: greyColor,
                          fontSize: 18)),
                  selectedTileColor: selectedIndex == 0
                      ? Colors.grey[200]
                      : Colors.transparent,
                  selected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: ListTile(
                  leading: Image.asset('assets/images/ic_clock.png', width: 25),
                  title: Text('1 ${Strings().getHoursLabel()}',
                      style: titleStyle(
                          fontFamily: mediumFontFamily,
                          color: greyColor,
                          fontSize: 18)),
                  selectedTileColor: selectedIndex == 1
                      ? Colors.grey[200]
                      : Colors.transparent,
                  selected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: ListTile(
                  leading: Image.asset('assets/images/ic_clock.png', width: 25),
                  title: Text('2 ${Strings().getHoursLabel()}',
                      style: titleStyle(
                          fontFamily: mediumFontFamily,
                          color: greyColor,
                          fontSize: 18)),
                  selectedTileColor: selectedIndex == 2
                      ? Colors.grey[200]
                      : Colors.transparent,
                  selected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: ListTile(
                  leading: Image.asset('assets/images/ic_clock.png', width: 25),
                  title: Text('3 ${Strings().getHoursLabel()}',
                      style: titleStyle(
                          fontFamily: mediumFontFamily,
                          color: greyColor,
                          fontSize: 18)),
                  selectedTileColor: selectedIndex == 3
                      ? Colors.grey[200]
                      : Colors.transparent,
                  selected: selectedIndex == 3,
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: button(() async {
                  // notification ..
                  await notificationPlugin.showDailyAtTime(
                      getTime (selectedIndex),
                      widget.data.mName,
                      widget.data.mDuration.toString(),
                      widget.data.mDose.toString(),
                      widget.data.mfName.toString()
                  );
                  widget.closeFunction();
                }, Strings().getDoneStrings()),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getTime(int selectedIndex) {
    String resultTime="";
    var selectedTime = Time(selectedIndex==1 ? 1 : selectedIndex==2? 2 : 3, selectedIndex==0 ? 30 : 0 );
    var newTime= Time(DateTime.now().hour+selectedTime.hour,DateTime.now().minute+selectedTime.minute);
    resultTime = '"'+newTime.hour.toString()+':'+newTime.minute.toString()+'"';
    return resultTime;
  }
}
