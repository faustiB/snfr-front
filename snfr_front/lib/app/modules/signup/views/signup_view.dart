import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../login/views/custom_form_field_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up in SneakerFinder'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
          ),
          CustomFormFieldView(
            margins: const EdgeInsets.only(top: 100, left: 10, right: 10),
            labelText: 'Email',
            textEditingController: emailController,
            isEmail: true,
          ),
          CustomFormFieldView(
            margins: const EdgeInsets.all(10),
            isPassword: true,
            labelText: 'Password',
            textEditingController: passwordController,
          ),
          CustomFormFieldView(
            margins: const EdgeInsets.all(10),
            isPassword: true,
            labelText: 'Confirm Password',
            textEditingController: confirmPasswordController,

          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              controller.email.value = emailController.text;
              controller.password.value = passwordController.text;
              controller.confirmPassword.value = confirmPasswordController.text;

              if (!controller.checkPassword()) {
                Get.snackbar(
                  'Error',
                  'Passwords do not match',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } else {
                await controller.signUp();
                if (controller.errorMessage.isEmpty) {
                  if(controller.userCredential.user?.email != null){
                    Get.snackbar(
                      'Success',
                      '${controller.userCredential.user?.email} Account created',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                    Get.offAllNamed(Routes.LOGIN);
                  }
                } else {
                  Get.snackbar(
                    'Error',
                    controller.errorMessage,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              }
            },
            child: const Text(
              'Create Account',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
