import 'package:Signs/Utils/apis.dart';
import 'package:Signs/Utils/network/network_util.dart';
import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/base/base_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UpdatePasswordService extends BaseService{
  Future<Result> updatePassword({
    @required String userId,
    @required String oldPassword,
    @required String newPassword}) async{
    final FormData data = FormData.fromMap(<String, dynamic>{
      'u_id':userId,
      'password':oldPassword,
      'new_password':newPassword
    });
    var result = await NetworkUtil().post("${APIS.UPDATE_PASSWORD}&lang=$lang", body: data);

    return result;
  }
}