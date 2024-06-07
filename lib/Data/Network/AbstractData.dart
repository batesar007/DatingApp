// abstract class AbstractData {
//   Future<Usermodel> SignUp(
//       {required String gmail,
//       required String Password,
//       required BuildContext context});
//   Future<Usermodel> Login({required String gmail, required String Password});
// }
import 'package:dating_app/Models/UserModel.dart';
import 'package:dating_app/enums/Allenums.dart';

abstract class AbstractData {
  Future<Usermodel> SignUp(Usermodel model, String password);
  Future<Usermodel> Login(String gmail, String password);
  Future<dynamic> get(path);
  Future<dynamic> post(path, Map<String, dynamic> data);
  Future<dynamic> update(path, Map<String, dynamic> data);
  Future<dynamic> delete(path, Map<String, dynamic> data);
  Future<dynamic> AuthFunction(Authenums authtype ,{Map<String, dynamic>? data});
}
//git hub