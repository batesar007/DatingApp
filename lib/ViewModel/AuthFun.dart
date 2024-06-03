// import 'package:dating_app/Controllers/AuthController.dart';
// import 'package:dating_app/Models/UserModel.dart';
// import 'package:dating_app/Data/Network/AbstractData.dart';
// import 'package:dating_app/main.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AuthFun extends AbstractData {
//   final _Auth = FirebaseAuth.instance;

//   @override
//   Future<Usermodel> SignUp(
//       {required String gmail,
//       required String Password,
//       required BuildContext context}) async {
//     try {
//       final data = await _Auth.createUserWithEmailAndPassword(
//           email: gmail, password: Password);
//       if (data.user?.uid != null) {
//         await createcollatction(
//             Usermodel(gmail: gmail, uid: data.user!.uid), context);
//         await preferences.setString("uid", data.user!.uid);
//         //next screen
//       }
//     } catch (e) {
//       print(e);
//     }
//     return Usermodel();
//   }

//   Future createcollatction(Usermodel model, BuildContext context) async {
//     try {
//       final provider = Provider.of<Authcontroller>(context, listen: false);
//       await AllManageData.getapis.userdoc(model.uid!).set(model.tojson()).then(
//         (value) async {
//           await provider.setuserdata(Usermodel.fromuser(model.tojson()));
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

// /********************************************************************************************************************************************************************************************************************************************************************************** */
//   @override
//   Future<Usermodel> Login({required String gmail, required String Password}) {
//     // TODO: implement Login
//     throw UnimplementedError();
//   }
// }

