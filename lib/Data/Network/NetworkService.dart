import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/Data/Network/AbstractData.dart';
import 'package:dating_app/Models/UserModel.dart';
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
  Future get(path) {
    Future<Object> responsedata;
    if (path is CollectionReference) {
      responsedata = path.get();
    } else if (path is Query<Map<String, dynamic>>) {
      responsedata = path.get();
    } else {
      responsedata = (path as DocumentReference).get();
    }

    return responsedata;
  }

  @override
  Future post(path, Map<String, dynamic> data) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future update(path, Map<String, dynamic> data) {
    // TODO: implement update
    throw UnimplementedError();
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
}
