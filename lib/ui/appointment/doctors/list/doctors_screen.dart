import 'package:Signs/Models/hospitals_model.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/ui/appointment/doctors/list/doctors_controller.dart';
import 'package:Signs/ui/appointment/doctors/widgets/doctor_card.dart';
import 'package:Signs/ui/appointment/doctors/widgets/empty_doctors_screen.dart';
import 'package:Signs/ui/appointment/speciality/specialty_screen.dart';
import 'package:Signs/widgets/appbar.dart';
import 'package:Signs/widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsScreen extends StatelessWidget {
  static const tag = "DoctorsScreen";
  @override
  Widget build(BuildContext context) {
    Datum hospital = ModalRoute.of(context).settings.arguments;
    return GetBuilder<DoctorsController>(
      init: DoctorsController(hospital: hospital),
      builder: (controller){
        return Scaffold(
          appBar: getAppBar(
            title: "Book Appointment"
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: LIGHT_WHITE_COLOR,
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
                      hintText: "Search by Doctor Name",
                      controller: controller.searchController,
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: ()async{
                        final result = await Get.toNamed(SpecialityScreen.tag, arguments: hospital);
                        if(result != null){
                          controller.filterBySpecialities(result);
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: MANATE, width: 1,),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(IC_SPECIALITY, width: 40, height: 40,),
                              SizedBox(width: 16,),
                              Expanded(
                                child: Text(controller.selectedSpecialities, maxLines: 1, style: hintTextStyle,),
                              ),
                              Icon(Icons.arrow_forward_ios, color: Battleship_GREY_COLOR,),
                              SizedBox(width: 16,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Expanded(
                      child: controller.isDoctorsLoading?Center(child: CircularProgressIndicator()):
                      controller.availableDoctors.isNotEmpty?
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.availableDoctors.length,
                        itemBuilder: (buildContext, index){
                          final doctor = controller.availableDoctors[index];
                          return Padding(
                            padding: const EdgeInsets.only(top:4.0, bottom: 4),
                            child: DoctorCard(doctor: doctor,),
                          );
                        }
                      ):EmptyDoctorsScreen(),
                    )
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

const double BANNER_HEIGHT = 140;