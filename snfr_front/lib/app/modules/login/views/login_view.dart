import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'custom_form_field_view.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
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
            textEditingController: passwordController,
            labelText: 'Password',
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                await controller.login(emailController.text, passwordController.text);
                print(controller.errorMessage);
                if (controller.errorMessage.isNotEmpty) {
                  Get.snackbar(
                    'Error',
                    controller.errorMessage,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                } else if (FirebaseAuth.instance.currentUser != null) {
                  Get.snackbar(
                    'Success',
                    'You are logged in',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                }
              } else {
                Get.snackbar(
                  'Error',
                  'Please fill all the fields',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            child: const Text('Sign in'),
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(Routes.SIGNUP);
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
