import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String errorMessage;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login(String email, String password) async {
    try {
      errorMessage = '';
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.LANDING);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'too-many-requests') {
        errorMessage = 'Too many requests. Try again later.';
      } else {
        errorMessage = 'Something went wrong. Try again later.';
      }
    }
  }

}
