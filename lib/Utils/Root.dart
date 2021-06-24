import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/Controller/authController.dart';
import 'package:todo_app_firebase/Pages/HomePage.dart';
import 'package:todo_app_firebase/Pages/LoginScreen.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null) ? HomeScreen() : LoginScreen();
    });
  }

}