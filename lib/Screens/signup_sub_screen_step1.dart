import 'package:flutter/material.dart';
import 'package:Signs/Screens/signup_screen_step2.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/widgets.dart';


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

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
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
          body: Container(
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
                              child: buttonChangeState(
                                  Male_inactive, Strings().getMaleStrings(),
                                  isFActive: false),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: buttonChangeState(
                                  Female_active, Strings().getFemaleStrings(),
                                  isFActive: true),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupScreenStep2()));
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