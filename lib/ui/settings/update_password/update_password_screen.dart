import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:Signs/widgets/animated_button.dart';
import 'package:Signs/widgets/appbar.dart';
import 'package:Signs/widgets/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Signs/ui/settings/update_password/update_password_controller.dart';

class UpdatePasswordScreen extends StatelessWidget {
  static const tag = "UpdatePasswordScreen";
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: ''),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: Get.height * .25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Appointment_BG,),
                fit: BoxFit.fill
              ),
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * .2,),
              GetBuilder<UpdatePasswordController>(
                init: UpdatePasswordController(),
                builder: (controller){
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
                      ),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(S.of(context).changePassword, style: boldOxfordBlueTextStyle,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0, right: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 16,),
                                        Text(S.of(context).oldPassword, style: lavanderGreyTextStyle,),
                                        SizedBox(height: 8,),
                                        CustomEditText(
                                          hintText: S.of(context).enterPassword,
                                          controller: controller.oldPasswordController,
                                          obscureText: true,
                                          fillColor: muncil,
                                          validator: (value){
                                            if(value.isEmpty){
                                              return S.of(context).validation_insert_data;
                                            } else{
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(height: 24,),
                                        Text(S.of(context).password, style: lavanderGreyTextStyle,),
                                        SizedBox(height: 8,),
                                        CustomEditText(
                                          hintText: S.of(context).enterPassword,
                                          controller: controller.newPasswordController,
                                          obscureText: true,
                                          fillColor: muncil,
                                          validator: (value){
                                            if(value.isEmpty){
                                              return S.of(context).validation_insert_data;
                                            } else if(controller.confirmNewPasswordController.text.length < 8){
                                              return S.of(context).passwordValidation;
                                            } else{
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(height: 24,),
                                        Text(S.of(context).confirmPassword, style: lavanderGreyTextStyle,),
                                        SizedBox(height: 8,),
                                        CustomEditText(
                                          hintText: S.of(context).enterPassword,
                                          controller: controller.confirmNewPasswordController,
                                          obscureText: true,
                                          fillColor: muncil,
                                          validator: (value){
                                            if(value.isEmpty){
                                              return S.of(context).validation_insert_data;
                                            } else if(controller.confirmNewPasswordController.text != controller.newPasswordController.text){
                                              return S.of(context).passwordConfirmValidation;
                                            } else{
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(height: 36,),
                                        AnimatedButton(
                                          btnName: S.of(context).resetPassword,
                                          controller: controller.resetBtnController,
                                          onPressed: (){
                                            if(_formKey.currentState.validate()){

                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
