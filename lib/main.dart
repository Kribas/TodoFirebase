import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_firebase/Pages/HomePage.dart';
import 'package:todo_app_firebase/Pages/LoginScreen.dart';
import 'package:todo_app_firebase/Pages/RegistrationScreen.dart';
import 'package:todo_app_firebase/isSignedIn.dart';
import 'Pages/WelcomeScreen.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/InstanceBinding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: IsSignedIn(),
      routes: {
        '/welcome':(context) => WelcomeScreen(),
        '/login':(context)=> LoginScreen(),
        '/reg':(context)=>RegistrationScreen(),
        '/dashboard':(context)=>HomePage(),
      },

    );
  }
}

