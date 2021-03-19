import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/ui/appointment/doctors/details/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final Datum hospital;
  final bool showHospitalInfo;
  final String appointmentDate;
  final String appointmentTime;
  const DoctorCard({Key key, this.doctor, this.showHospitalInfo = false, this.appointmentDate, this.appointmentTime, this.hospital}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(DoctorsDetailsScreen.tag, arguments: [doctor, hospital]);
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
            child: Column(
              children: [
                Row(
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
                if(showHospitalInfo)
                  ...[
                    Divider(
                      color: silverDivider,
                      height: 2,
                    ),
                    SizedBox(height: 16,),
                    Center(child: Text(hospital.hName, style: boldSmaltTextStyle,)),
                    SizedBox(height: 8,),
                    Center(
                      child: Row(
                        children: [
                          Image.asset(
                            MapMarker,
                            color: payneGrey,
                          ),
                          SizedBox(width: 8,),
                          Expanded(child: Text(hospital.hLocation, style: payneGreyStyle,)),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Center(
                      child: Row(
                        children: [
                          Text(appointmentDate, style: tealBlueSemiBoldStyle,),
                          SizedBox(width: 4,),
                          Text('at', style: dimGreySemiBold16TextStyle,),
                          SizedBox(width: 4,),
                          Text(appointmentTime, style: tealBlueSemiBoldStyle,)
                        ],
                      ),
                    ),

                  ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
