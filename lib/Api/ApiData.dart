import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiData {
  final _Auth = FirebaseAuth.instance;
  final _Database = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get getusercollection =>
      _Database.collection("user");
  // SignUpWithPhn(String phnNumber) async {
  //   final data = await _Auth.signInWithPhoneNumber(phnNumber);
  // }
}
