import 'package:dating_app/Data/Network/NetworkService.dart';
import 'package:dating_app/Models/UserModel.dart';
import 'package:dating_app/main.dart';

class UserViewmodel {
  final _Networkservice = Networkservice();
  Future<Usermodel> setuserdata(Usermodel model, String password) async {
    try {
      final user = await _Networkservice.SignUp(model, password);
      print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
      AllManageData.getapis.userdoc(user.uid).set(user.tojson());
      print("[[[[[[[[[[[[[${user}-=-=-=-[[[[[]]]]]");
      print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
