import 'package:get/get.dart';
import 'package:todo_app_firebase/GetXHelper/FirebaseController.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }

}