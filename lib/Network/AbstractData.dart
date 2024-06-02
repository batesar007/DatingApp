import 'package:dating_app/Models/UserModel.dart';
import 'package:flutter/material.dart';

abstract class AbstractData {
  Future<Usermodel> SignUp(
      {required String gmail,
      required String Password,
      required BuildContext context});
  Future<Usermodel> Login({required String gmail, required String Password});
}
