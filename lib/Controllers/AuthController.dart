import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/Data/Network/NetworkService.dart';
import 'package:dating_app/Models/UserModel.dart';
import 'package:dating_app/enums/Allenums.dart';
import 'package:dating_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _Networkservice = Networkservice();
  dynamic _user;
  Usermodel get getuserdata => _user;

  //SignUp Function
  Future SinUp(Map<String, dynamic> data) async {
    final userdata = Usermodel.fromuser(data);
    try {
      //TODO:
      final user = _Networkservice.AuthFunction(Authenums.SignUp,
              data: {"gmail": userdata.gmail, "password": data["password"]})
          as UserCredential;
      //TODO: get uid from Authantication
      final userid = user.user!.uid;
      if (userid.isNotEmpty) {
        await _Networkservice.post(AllManageData.getapis.userdoc(userid),
            userdata.copywith(uid: userid).tojson());
        _user = userdata.copywith(uid: userid);
      }
    } catch (e) {
      // show error
    } finally {
      notifyListeners();
    }
  }

  //Login
  Future Login(String gmail, String password) async {
    try {
      final snapshot = await _Networkservice.get(AllManageData
              .getapis.getusercollection
              .where("gmail", isEqualTo: gmail))
          as QuerySnapshot<Map<String, dynamic>>;
      if (snapshot.docs.isNotEmpty) {
        await _Networkservice.AuthFunction(Authenums.Login,
            data: {"gmail": gmail, "password": password}) as UserCredential;
        final Usermodel usermodeldata =
            Usermodel.fromuser(snapshot.docs.first.data());
        _user = usermodeldata;
        notifyListeners();

      }
    } catch (e) {
      print(e.toString());
    }
  }
}

