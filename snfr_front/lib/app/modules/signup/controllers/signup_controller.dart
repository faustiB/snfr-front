import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  late UserCredential userCredential;
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

  bool checkPassword() {
    if (password.value == confirmPassword.value) {
      return true;
    } else {
      return false;
    }
  }

  //Signup logic with friebase auth with uemail and password.
  signUp() async {
    try {
      errorMessage = '';
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.value, password: password.value);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
    } catch (e) {
      print(errorMessage);
    }
  }
}
