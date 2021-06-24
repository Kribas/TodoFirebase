import 'package:get/get.dart';
import 'package:todo_app_firebase/Controller/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

}