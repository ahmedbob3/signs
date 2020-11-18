import 'package:Signs/Blocs/subAccount%20bloc/subAccount_bloc.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Screens/signup_screen_step2.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'check_mobile_screen.dart';

class SignupSubAccountScreenStep1 extends StatefulWidget {
  SignupSubAccountScreenStep1({Key key}) : super(key: key);

  @override
  _SignupSubAccountScreenStep1State createState() => _SignupSubAccountScreenStep1State();
}

class _SignupSubAccountScreenStep1State extends State<SignupSubAccountScreenStep1> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "My Son"),
    ListItem(2, "My Mother")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  subAccountBloc _subAccountBloc;
  bool isActive = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _genderController = TextEditingController(text: '0');
  TextEditingController _relationController = TextEditingController();
  bool isLoading = false;
  String gender="";


  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _genderController.dispose();
    _relationController.dispose();
  }



  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    _subAccountBloc = subAccountBloc();

  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: _scaffoldKey,


        body: BlocBuilder<subAccountBloc, subAccountState>(
        bloc: _subAccountBloc,
        builder: (context, state) {

      if (state is subAccountLoadingState) {
        if (!isLoading) {
          showLoadingDialog(context);
          isLoading = true;
        }
      }
      else if (state is subAccountLoadedState) {
        print('loaded');

        Future.delayed(Duration(milliseconds: 1), () {
          if (state.subAccountresponse.code != 200) {
            Constants.subAccountList.add(_subAccountBloc);
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text(state.subAccountresponse.msg)));
            Navigator.of(context).pop();
          }
          else {

            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text(state.subAccountresponse.msg)));
          Navigator.of(context).pop();

          }
          _subAccountBloc.add(resetsubAccountState());
          isLoading = false;
        });
      }


      return Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Image.asset(
                      Login_background,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.95,
                    margin: EdgeInsets.only(
                        top: (Theme.of(context).platform == TargetPlatform.iOS
                            ? 120
                            : 130)),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28),
                        topLeft: Radius.circular(28),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(height: 10),
                        Text(Strings().getFirstNameStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                    controller : _firstNameController,
                                      decoration: InputDecoration(
                                        hintText:
                                            Strings().getEnterFirstStrings(),
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
                        Text(Strings().getLastNameStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      controller : _lastNameController,
                                      decoration: InputDecoration(
                                        hintText:
                                            Strings().getEnterLastStrings(),
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
                        Text(Strings().getGenderStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:
                              new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isActive=!isActive;
                                      if(isActive==true)
                                        gender= Strings().getMaleStrings();
                                    });
                                  },
                                  child:
                              buttonChangeState(
                                  Male_inactive, Strings().getMaleStrings(),
                                  isFActive: false),
                            ),
                            ),
                            SizedBox(width: 10),
                            Expanded(

                              child:
                              new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isActive=!isActive;
                                      if(isActive==true)
                                        gender= Strings().getFemaleStrings();
                                    });
                                  },
                                  child:
                              buttonChangeState(
                                  Female_active, Strings().getFemaleStrings(),
                                  isFActive: true),
                            ),
      ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(Strings().getSingRelationStrings(),
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: greyHeader,
                                fontSize: 14)),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: textFieldFill,
                              border: Border.all(
                                color: textFieldBorder,
                              ),
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: <Widget>[
                                Expanded(

                                    child: DropdownButton(
                                        elevation: 5,
                                        dropdownColor: textFieldFill,
                                        style: titleStyle(color: greyColor),
                                        icon: Icon(Icons.arrow_drop_down),
                                        underline: SizedBox(),
                                        isExpanded: true,
                                        value: _selectedItem,
                                        items: _dropdownMenuItems,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedItem = value;
                                          });
                                        }),
                                    // child:Container(
                                    //   child: TextField(
                                    //     decoration: InputDecoration(
                                    //       hintText:
                                    //       Strings().getSingSonStrings(),
                                    //       hintStyle: titleStyle(
                                    //           fontFamily: mediumFontFamily,
                                    //           color: greyColor,
                                    //           fontSize: 16),
                                    //       labelStyle:
                                    //       titleStyle(color: greyColor),
                                    //       border: InputBorder.none,
                                    //       focusedBorder: InputBorder.none,
                                    //       enabledBorder: InputBorder.none,
                                    //       errorBorder: InputBorder.none,
                                    //       disabledBorder: InputBorder.none,
                                    //     ),
                                    //     keyboardType: TextInputType.number,
                                    //   ),
                                    // ),


                                ),
                                // SizedBox(width: 5),
                                // Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        new GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupSubAccountScreenStep1()));
                          },
                          child: buttonWithIcon(Add_subaccount, Strings().getSingAddAnotherStrings(),isBackground: true),
                        ),
                        SizedBox(height: 30),
                        button(() {

                          //gender

                          if(_firstNameController.text.toString().isNotEmpty && _lastNameController.text.toString().isNotEmpty ){
                            _subAccountBloc.add(dosubAccountEvent(
                                (Constants.subAccountList.length+1),
                                _firstNameController.text.toString(),
                                _lastNameController.text.toString(),
                                gender,
                                _selectedItem.toString()
                            ));
                          }
                          else{
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text(Strings().getFillDataString()),
                                  duration: Duration(seconds: 3),
                                ));
                          }


                        }, Strings().getSaveStrings(), isFilledColor: true),
                        // SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: <Widget>[
                        //     Text(
                        //       Strings().getHavingAccountStrings(),
                        //       style: titleStyle(
                        //           fontFamily: mediumFontFamily,
                        //           color: greyColor,
                        //           fontSize: 14),
                        //     ),
                        //     new GestureDetector(
                        //       onTap: () {
                        //         Navigator.of(context).push(MaterialPageRoute(
                        //             builder: (context) => CheckMobileScreen()));
                        //       },
                        //       child: new Text(
                        //         Strings().getSingInText(),
                        //         style: titleStyle(
                        //             fontFamily: mediumFontFamily,
                        //             color: defaultBackgroundColor,
                        //             fontSize: 14),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Spacer()

                      ],
                    ),
                  ),
                ),

                Positioned(

                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child:  Image.asset(
                        CloseWhite,
                      ),
                    ),
                    top: 20,
                    left: 20),

                Positioned(
                    child: Text(
                        Strings().getSubAccountStrings(),
                        style: titleStyle(
                            fontFamily: boldFontFamily,
                            color: Colors.white,
                            fontSize: 32),
                      ),
                    top: 60,
                    left: 20),


              ],
            ),
          );
        },
        ),
        ),
      ),
    );
  }


}
class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}