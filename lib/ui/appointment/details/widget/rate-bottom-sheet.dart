import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/appointment_repository.dart';
import 'package:Signs/data/remote/appointment/models/appointment_response_entity.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

rateBottomSheet(AppointmentResponseData appointment){
  return Get.bottomSheet(
    RateAppointment(appointment: appointment,),
    barrierColor: Colors.black54,
    isScrollControlled: true,
    enterBottomSheetDuration: Duration(milliseconds: 500,),
  );
}
class RateAppointment extends StatefulWidget {
  final AppointmentResponseData appointment;

  const RateAppointment({Key key, this.appointment}) : super(key: key);
  @override
  _RateAppointmentState createState() => _RateAppointmentState();
}

class _RateAppointmentState extends State<RateAppointment> {
  TextEditingController doctorFeedBack   = TextEditingController();
  TextEditingController hospitalFeedBack = TextEditingController();
  double doctorRate = 5;
  double hospitalRate = 5;
  AnimatedButtonController _animatedButtonController = AnimatedButtonController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 0.7.sh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r,),
            topRight: Radius.circular(30.r,),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical:15.h,),
              child: Text('Rate Appointment', style:boldCobaltTextStyle ,),
            ),
            rateContainer(widget.appointment.dName, widget.appointment.dImage, (newRating){doctorRate = newRating;}, doctorFeedBack),
            rateContainer(widget.appointment.hName, '', (newRating){hospitalRate = newRating;}, hospitalFeedBack),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedButton(
                btnName: 'Rate',
                controller: _animatedButtonController,
                onPressed: (){
                  _animatedButtonController.startAnimation();
                  AppointmentRepository().rateAppointment(appointmentId: widget.appointment.aId, doctorRate: doctorRate.toString(), doctorFeedBack: doctorFeedBack.text, hospitalRate: hospitalRate.toString(), hospitalFeedBack: hospitalFeedBack.text)
                  .then((value){
                    _animatedButtonController.reverseAnimation();
                    Get.back();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

rateContainer(String name, String doctorImage, Function(double) onRateChange, TextEditingController controller){
  return Container(
    height: 0.24.sh,
    margin:EdgeInsets.symmetric(horizontal:20.w,vertical: 5.h,),
    padding:EdgeInsets.symmetric(vertical:10.h,),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r,),
        boxShadow: [
          BoxShadow(
            color:shadowColor,
            offset: Offset(0,2,),
            blurRadius: 11,
            spreadRadius: 0,
          ),
        ]
    ),
    child: Column(
      children: [
        Row(
          children: [
            doctorImage==''?
            SizedBox():
            Container(
              height: 0.08.sh,
              width: 0.1.sh,
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.r,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    doctorImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: boldBlack16TextStyle,
                  ),
                  SizedBox(height: 8,),
                  RatingBar(
                    itemCount: 5,
                    allowHalfRating: false,
                    initialRating: 5,
                    onRatingUpdate: onRateChange,
                    ratingWidget: RatingWidget(
                      empty: Image.asset(STAR_IN_ACTIVE),
                      full: Image.asset(STAR_ACTIVE)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h,),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r,),
                borderSide: BorderSide(
                    color: borderColor,
                    width: 0.6
                ),
              ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r,),
                borderSide: BorderSide(
                    color: borderColor,
                    width: 0.6
                ),
              ),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r,),
                borderSide: BorderSide(
                    color: borderColor,
                    width: 0.6
                ),
              ),
              hintText: 'Give us your feedback',
              hintStyle:regularGreyTextStyle,
            ),
          ),
        ),
      ],
    ),
  );
}
