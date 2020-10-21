import 'package:Signs/Utils/constants.dart';
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

  bool isActive= false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _nameController = TextEditingController();

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
                                    isActive= !Constants.medications[0];
                                    Constants.medications = [isActive, false, false,false, false, false,false, false, false,false, false];
                                  });
                                },
                                child: cardChangeState(true,
                                    Tablet_active,Tablet_inactive, Strings().getTabletStrings(),
                                    isFActive: Constants.medications[0]),
                              ),
                            ),
                            Expanded(


                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !Constants.medications[1];
                                    Constants.medications = [false, isActive, false,false, false, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Capsule_active,Capsule_inactive, Strings().getCapsuleStrings(),
                                    isFActive: Constants.medications[1]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !Constants.medications[2];
                                    Constants.medications = [false, false, isActive,false, false, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Liquid_active,Liquid_inactive, Strings().getLiquidStrings(),
                                    isFActive: Constants.medications[2]),
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
                                    isActive= !Constants.medications[3];
                                    Constants.medications = [false, false, false,isActive, false, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Drops_Active,Drops_inactive, Strings().getDropsStrings(),
                                    isFActive: Constants.medications[3]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !Constants.medications[4];
                                    Constants.medications = [false, false, false,false, isActive, false,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Suppository_active,Suppository_inactive, Strings().getSuppositoryStrings(),
                                    isFActive: Constants.medications[4]),
                              ),


                            ),
                            Expanded(


                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !Constants.medications[5];
                                    Constants.medications = [false, false, false,false, false, isActive,false, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Topical_active,Topical_inactive, Strings().getTopicalStrings(),
                                    isFActive: Constants.medications[5]),
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
                                    isActive= !Constants.medications[6];
                                    Constants.medications = [false, false, false,false, false, false,isActive, false, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Inhalator_active,Inhalator_inactive, Strings().getInhalersStrings(),
                                    isFActive: Constants.medications[6]),
                              ),

                            ),
                            Expanded(


                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !Constants.medications[7];
                                    Constants.medications = [false, false, false,false, false, false,false, isActive, false,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Implant_active,Implant_inactive, Strings().getImplantsStrings(),
                                    isFActive: Constants.medications[7]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !Constants.medications[8];
                                    Constants.medications = [false, false, false,false, false, false,false, false, isActive,false, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Patches_active,Patches_inactive, Strings().getPatchesStrings(),
                                    isFActive: Constants.medications[8]),
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
                                    isActive= !Constants.medications[9];
                                    Constants.medications = [false, false, false,false, false, false,false, false, false,isActive, false];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Injection_active,Injection_inactive, Strings().getInjectionsStrings(),
                                    isFActive: Constants.medications[9]),
                              ),

                            ),
                            Expanded(

                              child:
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isActive= !Constants.medications[10];
                                    Constants.medications = [false, false, false,false, false, false,false, false, false,false, isActive];
                                  });
                                },
                                child:
                                cardChangeState(true,
                                    Sachets_active,Sachets_inactive, Strings().getSachetsStrings(),
                                    isFActive: Constants.medications[10]),
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
