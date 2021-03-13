import 'package:Signs/data/remote/appointment/doctors/models/doctors_entity.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/choose_date_time/choose_date_time_widget.dart';
import 'package:Signs/ui/appointment/doctors/details/reservation/reservation_bottomsheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationBottomSheet extends StatelessWidget {
  final Doctor doctor;

  const ReservationBottomSheet({Key key, this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservationBottomSheetController>(
      init: ReservationBottomSheetController(),
      builder: (controller){
        return Container(
            height: MediaQuery.of(context).size.height * .8,
            child: PageView(
              controller: controller.pageController,
              children: [
                ChooseDateTimeWidget(doctor: doctor,),
                Container(
                  color: Colors.amber,
                )
              ],
              allowImplicitScrolling: false,
              physics:new NeverScrollableScrollPhysics()
            )
        );
      },
    );
  }
}
