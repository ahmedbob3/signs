import 'package:get/get.dart';

void showComingSoonMessage(){
  Get.snackbar(
    "Coming soon",
    "This feature will be added soon",
    snackPosition: SnackPosition.BOTTOM
  );
}