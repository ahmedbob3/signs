import 'package:flutter/material.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/styles.dart';
import 'package:signs/widgets/medication_cell.dart';
import 'package:signs/widgets/pill_cell.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MedicationScreen extends StatefulWidget {
  MedicationScreen({Key key}) : super(key: key);

  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  bool shouldOpenAllItems = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    'Medication List',
                    style: titleStyle(
                        color: defaultBackgroundColor,
                        fontSize: 24,
                        fontFamily: boldFontFamily),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      shouldOpenAllItems = !shouldOpenAllItems;
                      
                    });
                  },
                  child: Text(
                    shouldOpenAllItems ? 'Done' : 'Edit',
                    style: titleStyle(
                        color: greyColor,
                        fontSize: 20,
                        fontFamily: semiBoldFontFamily),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MedicationCell(shouldOpenAllItems: shouldOpenAllItems ? 1 : 2);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
