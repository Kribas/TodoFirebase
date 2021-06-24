import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String firstName, String lastName, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.back();
    }catch(e) {
        Get.snackbar("Error creating account", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      }catch(e) {
        Get.snackbar("Error Logging In", e.message, snackPosition: SnackPosition.BOTTOM);
      }
  }

  void signOut() async {
      try {
        await _auth.signOut();
      }catch(e) {
        Get.snackbar("Error creating account", e.message, snackPosition: SnackPosition.BOTTOM);
      }
  }
}