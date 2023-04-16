import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'custom_form_field_view.dart';
import 'sign_up_view.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Text(
              "LOGIN",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            onPressed: () {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                controller.login(emailController.text, passwordController.text);
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Get.to(() => SignUpView());
            },
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
