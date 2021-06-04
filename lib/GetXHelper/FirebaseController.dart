import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/Pages/HomePage.dart';
import 'package:todo_app_firebase/Pages/LoginScreen.dart';
import 'package:todo_app_firebase/Widgets/showLoading.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  var isLoading = true.obs;

  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String firstName, String lastName, String email, String password) async {
    CollectionReference reference = FirebaseFirestore.instance.collection("Users");


    Map<String,String> userdata =  {
      "First Name" : firstName,
      "Last Name" : lastName,
      "Email" : email
    };
    showLoading();
    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      reference.add(userdata).then((value) => Get.offAll(HomePage()));
    }).catchError(
            (onError) => Get.snackbar("Error while creating an account", onError.message));
  }

  void login(String email, String password) async {
    showLoading();
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(HomePage()))
    .catchError((onError) => Get.snackbar("Error while sign in", onError.message));
  }

  void signOut()async {
    await _auth.signOut().then((value) => Get.offAll(LoginScreen()));
  }



}