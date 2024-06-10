import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/Data/Network/AbstractData.dart';
import 'package:dating_app/Models/UserModel.dart';
import 'package:dating_app/enums/Allenums.dart';
import 'package:dating_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Networkservice extends AbstractData {
  final _Auth = FirebaseAuth.instance;

  @override
  Future delete(path, Map<String, dynamic> data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(path) async {
    Future<Object> responsedata;
    if (path is CollectionReference) {
      responsedata = path.get();
    } else if (path is Query<Map<String, dynamic>>) {
      //TODO: apply the where method;
      responsedata = path.get();
    } else {
      responsedata = (path as DocumentReference).get();
    }
    return responsedata;
  }

  @override
  Future post(path, Map<String, dynamic> data) {
    Future<void> responses;
    if (path is CollectionReference) {
      responses = path.add(data);
    } else {
      responses = (path as DocumentReference).set(data);
    }
    return responses;
  }
 
 
  @override
  Future update(path, Map<String, dynamic> data) {
    // TODO: implement update
    return (path as DocumentReference).update(data);
  }

  @override
  Future<Usermodel> Login(String gmail, String password) async {
    Usermodel? data;
    Future login() async {
      try {
        final snapshot = await AllManageData.getapis.getusercollection
            .where("gmail", isEqualTo: gmail)
            .get();
        if (snapshot.docs.isNotEmpty) {
          await _Auth.signInWithEmailAndPassword(
              email: gmail, password: password);
          final userDoc = snapshot.docs.first;
          final userData = userDoc.data();
          return Usermodel.fromuser(userData);
        }
      } catch (e) {
        rethrow;
      }
    }

    return data!;
  }

  @override
  Future<Usermodel> SignUp(Usermodel model, String password) async {
    Usermodel? data;
    try {
      final UserCredential = await _Auth.createUserWithEmailAndPassword(
          email: model.gmail, password: password);
      if (UserCredential.user!.uid.isNotEmpty) {
        data = model.copywith(uid: UserCredential.user!.uid);
      }
    } catch (e) {
      rethrow;
    }
    return data!;
  }

  @override
  Future AuthFunction(Authenums authtype, {Map<String, dynamic>? data}) async {
    //TODO: for multipul use example user sign with gamil and phn anouther metnod
    final String gmail = data!["gmail"];
    final String password = data["password"];
    //TODO: so i took gmail and password in this type
    if (authtype == Authenums.SignUp) {
      return await _Auth.createUserWithEmailAndPassword(
          email: gmail, password: password);
    } else {
      return await _Auth.signInWithEmailAndPassword(
          email: gmail, password: password);
    }
  }
}
