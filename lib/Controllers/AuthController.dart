import 'package:dating_app/Models/UserModel.dart';
import 'package:dating_app/ViewModel/User_ViewModel.dart';
import 'package:flutter/material.dart';

// class Authcontroller extends ChangeNotifier {
//   dynamic _user;
//   Usermodel get getuserdata => _user;
//   setuserdata(Usermodel model) {
//     _user = model;
//     notifyListeners();
//   }
// }

class Authcontroller extends ChangeNotifier {
  final _UserViewmodel = UserViewmodel();
  dynamic _user;
  Usermodel get getuserdata => _user;
  setuserdata(Usermodel model, String password) {
    final userdata = _UserViewmodel.setuserdata(model, password);
    _user = userdata;
    notifyListeners();
  }
}
