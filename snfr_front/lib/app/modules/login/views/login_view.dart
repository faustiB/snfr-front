import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'custom_form_field_view.dart';
class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomFormFieldView(
            margins: const EdgeInsets.only(top: 200, left: 10, right: 10),
            labelText: 'Email',
            isEmail: true,
          ),
          CustomFormFieldView(
            margins:const EdgeInsets.all(10),
            isPassword: true,
            labelText: 'Password',
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('Sign in'),
          ),
        ],
      )
    );
  }
}
