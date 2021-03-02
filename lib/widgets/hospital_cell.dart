import 'package:Signs/Utils/constants.dart';
import 'package:Signs/ui/hospital/details/hospital_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Blocs/navigation%20bloc/navigation_bloc.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalCell extends StatelessWidget {
  Datum hospitalItem;
  HospitalCell(this.hospitalItem, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Get.toNamed(HospitalDetailsScreen.tag, arguments: hospitalItem);
        },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 10).copyWith(right: Constants.languageId ==  languages.Arabic ? 0 : 10 ,
        left: Constants.languageId ==  languages.Arabic ? 10 : 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13),
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        hospitalItem.hImage),
                        fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            hospitalItem.hName,
                            style: titleStyle(
                                fontFamily: semiBoldFontFamily,
                                color: Color.fromRGBO(0, 62, 151, 1),
                                fontSize: 20),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              var latitude =
                                  hospitalItem.hLatlang.split(',')[0];
                              var longitude =
                                  hospitalItem.hLatlang.split(',')[1];
                              String googleUrl =
                                  'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
                              if (await canLaunch(googleUrl)) {
                                await launch(googleUrl);
                              } else {
                                throw 'Could not open the map.';
                              }
                            },
                            child: Image.asset(Direction))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          MapMarker,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            hospitalItem.hLocation,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: titleStyle(
                              fontFamily: mediumFontFamily,
                              color: Color.fromRGBO(62, 86, 119, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class HospitalCell extends StatefulWidget {
//   HospitalCell({Key key}) : super(key: key);

//   @override
//   _HospitalCellState createState() => _HospitalCellState();
// }

// class _HospitalCellState extends State<HospitalCell> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: () {
//         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HospitalDetailsScreen()));
//         BlocProvider.of<NavigationBloc>(context).add(openHospitalScreen());
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
//           ],
//         ),
//         child: ListTile(
//           leading: Image.asset(Male_inactive),
//           title: Text(
//             'New Mowasat Hospital',
//             style: titleStyle(
//                 fontFamily: semiBoldFontFamily, color: defaultBackgroundColor),
//           ),
//           subtitle: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(Icons.location_pin),
//               Text('Salem Al Mubarak St,',
//                   style: titleStyle(
//                       fontFamily: mediumFontFamily,
//                       color: Color.fromRGBO(62, 86, 119, 1)))
//             ],
//           ),
//           trailing: Image.asset(Direction),
//         ),
//       ),
//     );
//   }
// }
