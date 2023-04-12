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
              //TODO: handle firebase login on controller.
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