import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/GetXHelper/FirebaseController.dart';
import 'package:todo_app_firebase/Pages/HomePage.dart';
import 'package:todo_app_firebase/Pages/LoginScreen.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null ? HomePage() : LoginScreen();
    });
  }

}