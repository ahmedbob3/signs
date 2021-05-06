import 'package:Signs/base/base_controller.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/cupertino.dart';

class UpdatePasswordController extends BaseController{
  AnimatedButtonController resetBtnController = AnimatedButtonController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
}