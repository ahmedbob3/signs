import 'package:flutter/material.dart';
import 'package:Signs/Screens/signup_screen_step1.dart';
import 'package:Signs/Screens/signup_screen_step2.dart';
import 'package:Signs/Screens/signup_screen_step3.dart';
import 'package:Signs/Screens/signup_sub_screen_step1.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';

import 'check_mobile_screen.dart';

class MedicineForm extends StatefulWidget {
  MedicineForm({Key key}) : super(key: key);

  @override
  _MedicineFormState createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {

  List<bool> medications = [false, false, false,false, false, false,false, false, false,false, false];
  bool isActive= false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: Colors.white,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    margin: EdgeInsets.only(
                        top: (Theme.of(context).platform == TargetPlatform.iOS
                            ? 120
                            : 130)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[0];
                                    medications = [isActive, false, false,false, false, false,false, false, false,false, false];
                                  });
                                },
                                child: cardChangeState(true,
                                    Tablet_active,Tablet_inactive, Strings().getTabletStrings(),
                                    isFActive: medications[0]),
                              ),
                            ),
                            Expanded(


                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[1];
                                    medications = [false, isActive, false,false, false, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Capsule_active,Capsule_inactive, Strings().getCapsuleStrings(),
                                    isFActive: medications[1]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[2];
                                    medications = [false, false, isActive,false, false, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Liquid_active,Liquid_inactive, Strings().getLiquidStrings(),
                                    isFActive: medications[2]),
                              ),

                            ),
                          ],
                        ),
                        SizedBox(height: 10),


                        Row(
                          children: <Widget>[
                            Expanded(


                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[3];
                                    medications = [false, false, false,isActive, false, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Drops_Active,Drops_inactive, Strings().getDropsStrings(),
                                    isFActive: medications[3]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[4];
                                    medications = [false, false, false,false, isActive, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Suppository_active,Suppository_inactive, Strings().getSuppositoryStrings(),
                                    isFActive: medications[4]),
                              ),


                            ),
                            Expanded(


                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[5];
                                    medications = [false, false, false,false, false, isActive,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Topical_active,Topical_inactive, Strings().getTopicalStrings(),
                                    isFActive: medications[5]),
                              ),

                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: <Widget>[
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[6];
                                    medications = [false, false, false,false, false, false,isActive, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Inhalator_active,Inhalator_inactive, Strings().getInhalersStrings(),
                                    isFActive: medications[6]),
                              ),

                            ),
                            Expanded(


                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[7];
                                    medications = [false, false, false,false, false, false,false, isActive, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Implant_active,Implant_inactive, Strings().getImplantsStrings(),
                                    isFActive: medications[7]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[8];
                                    medications = [false, false, false,false, false, false,false, false, isActive,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Patches_active,Patches_inactive, Strings().getPatchesStrings(),
                                    isFActive: medications[8]),
                              ),

                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[9];
                                    medications = [false, false, false,false, false, false,false, false, false,isActive, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Injection_active,Injection_inactive, Strings().getInjectionsStrings(),
                                    isFActive: medications[9]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !medications[10];
                                    medications = [false, false, false,false, false, false,false, false, false,false, isActive];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Sachets_active,Sachets_inactive, Strings().getSachetsStrings(),
                                    isFActive: medications[10]),
                              ),

                            ),
                            Expanded(
                              child: cardChangeState(false,
                                  Capsule_active,Capsule_inactive, Strings().getCapsuleStrings(),
                                  isFActive: false),
                            ),
                          ],
                        ),



                        Spacer()

                      ],
                    ),
                  ),
                ),

                Positioned(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromRGBO(130, 130, 130, 1),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    top: 5,
                    left: 5),

                Positioned(
                    child: Text(
                        Strings().getMedicineStrings(),
                        style: titleStyle(
                            fontFamily: boldFontFamily,
                            color: defaultBackgroundColor,
                            fontSize: 32),
                      ),
                    top: 60,
                    left: 35),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
