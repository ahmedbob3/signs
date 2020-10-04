import 'package:flutter/material.dart';
import 'package:signs/Medication%20bloc/medication_bloc.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/pill_cell.dart';

class MediciationSection extends StatefulWidget {
  List<String> medicationList;
  MediciationSection({Key key, this.medicationList}) : super(key: key);

  @override
  MediciationSectionState createState() => MediciationSectionState();
}

class MediciationSectionState extends State<MediciationSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Upcoming Reminder',
            style: titleStyle(
                fontFamily: boldFontFamily,
                fontSize: 22,
                color: defaultBackgroundColor)),
        Container(
          height: 140,
          child: widget.medicationList.length > 0 ? ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return PillCell(isNewPill: false);
            },
          ) : PillCell(isNewPill: true)
        ),
      ],
    );
  }
}
