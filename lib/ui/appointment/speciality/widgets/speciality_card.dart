import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';
import 'package:flutter/material.dart';

class SpecialityCard extends StatelessWidget {
  final HospitalSpecialitiesData specialitiesData;

  const SpecialityCard({Key key, this.specialitiesData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 3;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(specialitiesData.sActiveIcon, width: 55, height: 55,),
            SizedBox(height: 14,),
            Text(specialitiesData.sName)
          ],
        ),
      ),
    );
  }
}
