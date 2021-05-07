import 'package:Signs/Utils/singleton.dart';
import 'package:Signs/base/base_controller.dart';
import 'package:Signs/data/remote/auth/auth_repository.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends BaseController{
  AnimatedButtonController resetBtnController = AnimatedButtonController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();
  final user = Singleton().loginModel.data;

  void updatePassword(){
    resetBtnController.startAnimation();
    update();
    _authRepository.updatePassword(userId: user.uId, oldPassword: oldPasswordController.text, newPassword: newPasswordController.text).then(
            (updatePasswordResult){
              handleResponse(
                result: updatePasswordResult,
                onSuccess: (){
                  if(updatePasswordResult.data['code'] == 501){
                    Get.dialog(
                        AlertDialog(
                          title: Text(S.of(Get.context).warning),
                          content: Text(S.of(Get.context).updatePasswordError),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Get.back();
                                },
                                child: Text(S.of(Get.context).ok)
                            )
                          ],
                        )
                    );
                  } else{
                    Get.dialog(
                        AlertDialog(
                          title: Text(S.of(Get.context).warning),
                          content: Text(updatePasswordResult.data['msg']),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Get.back();
                                  Get.back();
                                },
                                child: Text(S.of(Get.context).ok)
                            )
                          ],
                        ),
                      barrierDismissible: false
                    );
                  }
                },
                onFailed: (){}
              );
              resetBtnController.reverseAnimation();
              update();
            }
    );
  }
}