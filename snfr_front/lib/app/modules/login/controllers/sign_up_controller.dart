import 'package:get/get.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpControllerController
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  final count = 0.obs;
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

  void increment() => count.value++;
}
