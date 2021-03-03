import 'package:Signs/data/remote/appointment/doctors/models/doctor.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key key, this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(doctor.imageUrl, width: 80, height: 150,),
            SizedBox(width: 12,),
            Column(
              children: [
                Text(doctor.name),
                Text(doctor.bio),
                Text(doctor.speciality),
              ],
            )
          ],
        ),
      ),
    );
  }
}
