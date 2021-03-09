import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/ui/appointment/doctors/details/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key key, this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(DoctorsDetailsScreen.tag, arguments: doctor);
      },
      child: Hero(
        tag: doctor.id,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                    width: 110.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(doctor.imageUrl)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                    ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(doctor.name, style: boldBlackTextStyle, maxLines: 1, textAlign: TextAlign.center,),
                      SizedBox(height: 14,),
                      AutoSizeText(doctor.bio, style: Theme.of(context).textTheme.bodyText2, maxLines: 2, textAlign: TextAlign.center,),
                      SizedBox(height: 14,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Color.fromRGBO(255, 237, 190, 1),
                          ),
                          color: Color.fromRGBO(255, 249, 234, 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(doctor.speciality, style: gambogeRegularTextStyle, maxLines: 1,),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
