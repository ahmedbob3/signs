import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/medication_cell.dart';
import 'package:flutter/material.dart';


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
                itemCount: Constants.medicationList.length,
                itemBuilder: (context, index) {
                  return  MedicationCell(shouldOpenAllItems: shouldOpenAllItems ? 1 : 2, data: Constants.medicationList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
