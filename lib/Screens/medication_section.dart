import 'package:Signs/Blocs/medication%20bloc/medication_bloc.dart';
import 'package:Signs/Models/medication_data.dart';
import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/pill_cell.dart';

class MediciationSection extends StatefulWidget {
  List<Datum> medicationList;
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(Strings().getRemindersStrings(),
              style: titleStyle(
                  fontFamily: boldFontFamily,
                  fontSize: 22,
                  color: Colors.white)),
        ),
        Container(
            height: 140,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: widget.medicationList.length > 0
                ? ListView.builder(
                    itemCount: widget.medicationList.length + 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0 && widget.medicationList.length >= 1
                          ? Container(
                              width: 230,
                              child: PillCell(isNewPill: true),
                            )
                          : PillCell(isNewPill: false,data: widget.medicationList[index-1]);
                    },
                  )
                : PillCell(isNewPill: true)),
      ],
    );
  }
}
