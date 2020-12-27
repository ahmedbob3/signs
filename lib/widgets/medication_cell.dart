
import 'package:Signs/Blocs/medication%20bloc/medication_bloc.dart';
import 'package:Signs/Blocs/medicationList%20bloc/medicationList_bloc.dart';
import 'package:Signs/Models/response/medication_model.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';



class MedicationCell extends StatefulWidget {
  bool isActive;
  int shouldOpenAllItems = -1;
  Datum data ;
  int index ;
  MedicationListBloc bloc;

  MedicationCell({Key key, this.isActive = true, this.shouldOpenAllItems, this.data,this.index,this.bloc})
      : super(key: key);

  @override
  _MedicationCellState createState() => _MedicationCellState();
}

class _MedicationCellState extends State<MedicationCell> {
  bool isOpened = false;
  bool isSelected = false;

  SlidableController slidableController;
  final _slidableKey = GlobalKey<SlidableState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slidableController = SlidableController(
      onSlideAnimationChanged: (Animation<double> slideAnimation) {
        setState(() {
          if (slideAnimation == null) {
            // isOpened = true;
            print('nulll');
            widget.shouldOpenAllItems = -1;
          } else {
            print('slideAnimation.status ${slideAnimation.status}');
            if (slideAnimation.status == AnimationStatus.completed) {
              // isOpened = true;
              widget.shouldOpenAllItems = -1;
            } else if (slideAnimation.status == AnimationStatus.dismissed) {
              // isOpened = false;
            }
          }
        });
      },
      onSlideIsOpenChanged: (bool isOpen) {
        setState(() {
          isOpened = isOpen;
          // if ( !isOpened ){
          // widget.shouldOpen = false;
          // }
        });
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    if (widget.shouldOpenAllItems == 1 && _slidableKey.currentState != null) { // 1 to be opened 
      _slidableKey.currentState.open(actionType: SlideActionType.primary);
    } else if (widget.shouldOpenAllItems == 2 && _slidableKey.currentState != null) { // 2 to be closed
      _slidableKey.currentState.close();
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Slidable(
        key: _slidableKey,
        actionPane: SlidableDrawerActionPane(),
        // actionExtentRatio: 0.25,
        controller: slidableController,
        actions: <Widget>[
          // IconButton(
          //   icon: isSelected
          //       ? Icon(
          //           Icons.check_circle,
          //           size: 30,
          //           color: defaultBackgroundColor,
          //         )
          //       : CircleAvatar(
          //           radius: 14,
          //           backgroundColor: Colors.grey,
          //           child: CircleAvatar(
          //             radius: 12,
          //             backgroundColor: Colors.white,
          //           ),
          //         ),
          //   onPressed: () {
          //     setState(() {
          //       isSelected = !isSelected;
          //     });
          //   },
          // )
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Constants.medicationList.elementAt(widget.index).isActive  == "1"
                ? Colors.orange
                : Color.fromRGBO(199, 199, 204, 1),
            iconWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    Constants.medicationList.elementAt(widget.index).isActive  == "1" ? Medicine_Aactive : Medicine_Deactive),
                SizedBox(height: 10),
                Text(Constants.medicationList.elementAt(widget.index).isActive  == "1" ? 'Activate' : 'Deactivate',
                    style: titleStyle(
                        color: Colors.white, fontFamily: semiBoldFontFamily,fontSize: 14))
              ],
            ),
            onTap: () {
              setState(() {
                Constants.medicationList.elementAt(widget.index).isActive = Constants.medicationList.elementAt(widget.index).isActive  == "1" ? "0":"1";
                widget.bloc.add(doMedicationListEvent(
                    Constants.medicationList.elementAt(widget.index).mId.toString(),
                    Constants.medicationList.elementAt(widget.index).isActive
                ));
              });
            },
          ),
          IconSlideAction(
            color: Colors.red,
            iconWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Medicine_Delete),
                SizedBox(height: 10),
                Text(Strings().getDeleteLabel(),
                    style: titleStyle(
                        color: Colors.white, fontFamily: regularFontFamily))
              ],
            ),
            onTap: () {
              Constants.isActive =2;
              widget.bloc.add(doMedicationListEvent(
                  Constants.medicationList.elementAt(widget.index).mId.toString(),
                  "2"
              ));
            },
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: !isOpened
                ? Colors.transparent
                : Constants.medicationList.elementAt(widget.index).isActive == "1"
                    ? Colors.orange
                    : Color.fromRGBO(199, 199, 204, 1),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(30),
              bottomStart: Radius.circular(30),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
              ],
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(Circle),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(widget.data != null ? widget.data.mfImage:Add_pill_Active),
                            SizedBox(height: 10),
                            Text(
                              widget.data.mName,
                              style: titleStyle(
                                  fontFamily: semiBoldFontFamily,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.data.mDose + " " + widget.data.mfName,
                              style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                fontSize: 16,
                                color: Color.fromRGBO(96, 96, 96, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                  widget.data.rememberTime.length !=0 ?
                                  widget.data.lessTime
                                  : "",
                                style: titleStyle(
                                  fontFamily: semiBoldFontFamily,
                                  fontSize: 16,
                                  color: Color.fromRGBO(96, 96, 96, 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            widget.isActive
                                ? SizedBox(height: 33)
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(246, 249, 255, 1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 7),
                                      child: Text(
                                        Strings().getDeactivatedLabel(),
                                        style: titleStyle(
                                          fontFamily: semiBoldFontFamily,
                                          fontSize: 14,
                                          color: Color.fromRGBO(96, 96, 96, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                widget.data.mDuration + ' ${Strings().getDaysLabel()}',
                                style: titleStyle(
                                  fontFamily: semiBoldFontFamily,
                                  fontSize: 16,
                                  color: defaultBackgroundColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
