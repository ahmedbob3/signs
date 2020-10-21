import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Signs/Blocs/navigation%20bloc/navigation_bloc.dart';
import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Screens/hospital_details_screen.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/styles.dart';

class HospitalCell extends StatelessWidget {
  Datum hospitalItem;
  HospitalCell(this.hospitalItem, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HospitalDetailsScreen(hospitalItem)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ],
        ),
        child: ListTile(
          leading: Image.asset(Male_inactive),
          title: Text(
            hospitalItem.hName,
            style: titleStyle(
                fontFamily: semiBoldFontFamily, color: defaultBackgroundColor),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on),
              Expanded(
                child: Text(hospitalItem.hLocation,
                overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: titleStyle(
                        fontFamily: mediumFontFamily,
                        color: Color.fromRGBO(62, 86, 119, 1))),
              )
            ],
          ),
          trailing: Image.asset(Direction),
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
