import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/doctors/list/doctors_screen.dart';
import 'package:Signs/ui/appointment/speciality/widgets/empty_specialities.dart';
import 'package:Signs/ui/appointment/speciality/widgets/speciality_card.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:Signs/widgets/appbar.dart';
import 'package:Signs/widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:Signs/ui/appointment/speciality/speciality_controller.dart';

class SpecialityScreen extends StatelessWidget {
  static const tag = "SpecialityScreen";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialityController>(
      init: SpecialityController(),
      builder: (controller) {
        return Scaffold(
          appBar: getAppBar(
              title: "Choose Speciality"
          ),
          backgroundColor: LIGHT_WHITE_COLOR,
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Image.asset(Doctors_BG, height: BANNER_HEIGHT, width: double.infinity, fit: BoxFit.cover ,),
              Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: BANNER_HEIGHT - 25,),
                    CustomEditText(
                      prefixIcon: Icon(Icons.search, color: TAUPE_GREY_COLOR, size: 18,),
                      hintText: "Search Speciality",
                    ),
                    SizedBox(height: 30,),
                    Expanded(
                      child: controller.isLoading? Center(child: CircularProgressIndicator()):
                         controller.availableSpecialities.isNotEmpty ? Wrap(
                           alignment: WrapAlignment.start,
                           crossAxisAlignment: WrapCrossAlignment.start,
                           children: controller.availableSpecialities.map(
                                   (speciality) => SpecialityCard(specialitiesData: speciality,)
                           ).toList()
                         ):EmptySpecialities()
                    ),
                    AnimatedButton(
                      btnName: "Next",
                      onPressed: (){},
                      controller: AnimatedButtonController(),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
