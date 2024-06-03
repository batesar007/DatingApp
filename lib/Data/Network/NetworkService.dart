import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/Data/Network/AbstractData.dart';
import 'package:dating_app/Models/UserModel.dart';
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
  Future<Usermodel> Login(String gmail, String password) {
    // TODO: implement Login
    throw UnimplementedError();
  }

  @override
  Future<Usermodel> SignUp(Usermodel model, String password) async {
    Usermodel? data;
    try {
      final user = await _Auth.createUserWithEmailAndPassword(
          email: model.gmail, password: password);
      if (user.user!.uid.isNotEmpty) {
        data = model.copywith(uid: user.user!.uid);
      }
    } catch (e) {
      rethrow;
    }
    return data!;
  }
}

