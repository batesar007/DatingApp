import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/Controllers/AuthController.dart';
import 'package:dating_app/Models/UserModel.dart';
import 'package:dating_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Auth = FirebaseAuth.instance;
final Database = FirebaseFirestore.instance;
// final storage=firebases;

final class Authfunction {
  BuildContext context;
  Authfunction(this.context);

  Future signup(Usermodel model, password) async {
    try {
      final data = await Auth.createUserWithEmailAndPassword(
          email: model.gmail!, password: password);
      if (data.user?.uid != null) {
        await createcollatction(model, data.user!.uid);
        preferences.setString("uid", data.user!.uid);
        //next screen
      }
    } catch (e) {
      print(e);
    }
  }

  Future createcollatction(Usermodel model, String uid) async {
    try {
      final provider = Provider.of<Authcontroller>(context, listen: false);
      await Database.collection("user").doc(uid).set(model.tojson()).then(
        (value) async {
          await provider.setuserdata(Usermodel.fromuser(model.tojson(), uid));
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
