import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/Controller/authController.dart';

class HomeScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: () {
            controller.signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}

