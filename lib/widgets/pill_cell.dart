import 'package:flutter/material.dart';
import 'package:signs/Screens/medicine_add.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/styles.dart';

class PillCell extends StatelessWidget {
  bool isNewPill;
  PillCell({Key key, this.isNewPill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: isNewPill ? (MediaQuery.of(context).size.width * 0.87) : 220,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ]),
      child: Stack(
        children: <Widget>[
          Image.asset(Circle),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   Image.asset(!isNewPill ? Add_pill_Active : Add_pill),
                    !isNewPill ? Text('8-9 AM', style: titleStyle(fontFamily: semiBoldFontFamily, fontSize: 16, color: Color.fromRGBO(96, 96, 96, 1),)) : Container()
                  ],
                ),
                SizedBox(height: 10),
                !isNewPill ? 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text('Metformin', style: titleStyle(fontFamily: semiBoldFontFamily, fontSize: 20, color: Colors.black),),
                  Text('2 pills', style: titleStyle(fontFamily: semiBoldFontFamily, fontSize: 16, color: Color.fromRGBO(96, 96, 96, 1),))
                ],):
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text('Add a reminder about a pill',
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: Colors.black54,
                                fontSize: 18))),


                    GestureDetector(
                      onTap: () {
                        !isNewPill ? (){} :
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddMedication()));
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: defaultBackgroundColor,
                        size: 40,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
