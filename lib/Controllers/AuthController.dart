import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/Data/Network/NetworkService.dart';
import 'package:dating_app/Models/UserModel.dart';
import 'package:dating_app/enums/Allenums.dart';
import 'package:dating_app/main.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/screens/BottomBar.dart/BottomBarScreen.dart';
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
  Future SinUp(Map<String, dynamic> data, BuildContext context) async {
    final Usermodel userdata = Usermodel.fromuser(data["userdata"]);
    print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
    try {
      //TODO:
      final credential = await _Networkservice.AuthFunction(Authenums.SignUp,
              data: {"gmail": userdata.gmail, "password": data["password"]})
          as UserCredential;
      // final credential = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(
      //         email: userdata.gmail, password: password);
      //TODO: get uid from Authantication
      final String userid = credential.user!.uid;
      print("-=-=-=-=--=///////${userid}\\\\\\-=-=-=-");
      print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
      if (userid.isNotEmpty) {
        await _Networkservice.post(AllManageData.getapis.userdoc(userid),
            await userdata.copywith(uid: userid).tojson());
        _user = userdata.copywith(uid: userid);
        App_service(context).pushTo(BottomBarScreen());
      }
    } catch (e) {
      print("///////////catch--${e}///////");
      //  print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
      // show error
    } finally {
      notifyListeners();
    }
  }

  //Login
  Future Login(String gmail, String password) async {
    try {
      final snapshot = await _Networkservice.getData(AllManageData
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
