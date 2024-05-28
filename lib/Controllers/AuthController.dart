import 'package:dating_app/Models/UserModel.dart';
import 'package:flutter/material.dart';

class Authcontroller extends ChangeNotifier {
  dynamic _user;
  Usermodel get getuserdata => _user;
  setuserdata(Usermodel model) {
    _user = model;
    notifyListeners();
  }
}
