import 'package:Signs/base/base_controller.dart';
import 'package:flutter/material.dart';

class ReservationBottomSheetController extends BaseController{
  PageController pageController = PageController();

  goToNextPage(){
    pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}