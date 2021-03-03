import 'package:Signs/utils/network/error.dart';

class Result{
  dynamic data;
  Status status;
  ApplicationError error;

  Result.success(data){
    this.data = data;
    status = Status.OK;
  }

  Result.failed(ApplicationError error){
    this.error = error;
    status = Status.FAILED;
  }
}

enum Status{
  OK,FAILED
}