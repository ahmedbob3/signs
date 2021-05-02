import 'package:Signs/generated/l10n.dart';
import 'package:get/get.dart';

void showComingSoonMessage(){
  Get.snackbar(
    S.of(Get.context).comingSoon,
      S.of(Get.context).willBeAdded,
    snackPosition: SnackPosition.BOTTOM
  );
}