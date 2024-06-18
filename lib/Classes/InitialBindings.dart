import 'package:dating_app/Controllers/AuthController.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authcontroller>(() => Authcontroller());
  }
}
