import 'package:Signs/base/base_controller.dart';
import 'package:flutter/material.dart';

class ReservationBottomSheetController extends BaseController{
  PageController pageController = PageController();

  goToNextPage(){
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}