import 'package:Signs/Utils/network/result.dart';
import 'package:get/get.dart';

class BaseController extends GetxController{

  handleResponse({Result result, Function onSuccess, Function onFailed}){
    if(result.status == Status.OK){
      onSuccess();
    } else if(result.status == Status.FAILED){
      /*if(result.error.type is Unauthorized){
        logOut();
      }*/
      print("network error: ${result.error.errorMsg}");
      onFailed?.call();
    }
  }
}