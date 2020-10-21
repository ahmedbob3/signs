import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Screens/signup_screen_step2.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';

import 'medicine_form.dart';

class AddMedication extends StatefulWidget {
  AddMedication({Key key}) : super(key: key);

  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  List<bool> medications = [false, false, false, false, false];
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            // height: MediaQuery.of(context).size.height,
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
                                      keyboardType: TextInputType.number,
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
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    right: 50),
                                Expanded(
                                  child: Container(
                                    child: TextField(
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
                                        Navigator.of(context).pop();
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
                                        Navigator.of(context).pop();
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupScreenStep2()));
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
                          isActive = !medications[0];
                          medications = [
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
                          isActive = !medications[1];
                          medications = [
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
                          isActive = !medications[2];
                          medications = [
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
                          isActive = !medications[3];
                          medications = [
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
                          isActive = !medications[4];
                          medications = [
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
                          isFActive: medications[0])
                      : index == 1
                          ? cardChangeState(
                              true, Capsule_active, Capsule_inactive, Strings().getCapsuleStrings(),
                              isFActive: medications[1])
                          : index == 2
                              ? cardChangeState(
                                  true, Liquid_active, Liquid_inactive, Strings().getLiquidStrings(),
                                  isFActive: medications[2])
                              : index == 3
                                  ? cardChangeState(
                                      true, Drops_Active, Drops_inactive, Strings().getDropsStrings(),
                                      isFActive: medications[3])
                                  : index == 4
                                      ? cardChangeState(
                                          true,
                                          Suppository_active,
                                          Suppository_inactive,
                                          Strings().getSuppositoryStrings(),
                                          isFActive: medications[4])
                                      : Container(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
