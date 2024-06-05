import 'package:cloud_firestore/cloud_firestore.dart';

class ApiData {
  final _Database = FirebaseFirestore.instance;
//  final String id;
  //collection of user
  CollectionReference<Map<String, dynamic>> get getusercollection =>
      _Database.collection("user");
  // doc for user
  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      getusercollection.doc(id);
}
