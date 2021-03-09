import 'package:Signs/data/remote/appointment/speciality/models/hospital_specialities_entity.dart';
import 'package:Signs/ui/appointment/speciality/speciality_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:get/get.dart';

class SpecialityCard extends StatelessWidget {
  final HospitalSpeciality specialitiesData;
  final Function onTap;

  const SpecialityCard({Key key, this.specialitiesData, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = (size.width / 2) - 30;
    return GestureDetector(
      onTap: (){
        SpecialityController specialityController = Get.find<SpecialityController>();
        specialityController.selectSpeciality(specialitiesData);
      },
      child: Card(
        color: specialitiesData.isSelected? MEDIUM_TEAL_BLUE:Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        elevation: 2,
        child: Container(
          width: itemWidth,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(specialitiesData.isSelected? specialitiesData.selectedIcon:specialitiesData.unselectedIcon, width: 55, height: 55,),
                ),
                SizedBox(height: 4,),
                AutoSizeText(specialitiesData.name,
                  style: specialitiesData.isSelected?selectedItemTextStyle:unselectedItemTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
