import 'package:get/get.dart';

import 'package:snfr_front/app/modules/login/controllers/custom_form_field_controller_controller.dart';
import 'package:snfr_front/app/modules/signup/controllers/signup_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
    Get.lazyPut<CustomFormFieldControllerController>(
      () => CustomFormFieldControllerController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
