import 'package:Signs/Utils/network/result.dart';
import 'package:Signs/data/remote/auth/services/update_password_service.dart';
import 'package:flutter/material.dart';

class AuthRepository{
  UpdatePasswordService _updatePasswordService = UpdatePasswordService();

  Future<Result> updatePassword({
    @required String userId,
    @required String oldPassword,
    @required String newPassword}){
    return _updatePasswordService.updatePassword(userId: userId, oldPassword: oldPassword, newPassword: newPassword);
  }
}