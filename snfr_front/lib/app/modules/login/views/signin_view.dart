import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snfr_front/app/modules/login/views/custom_form_field_view.dart';

class SigninView extends GetView {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SigninView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomFormFieldView(
            margins: const EdgeInsets.only(top: 30, left: 10, right: 10),
            labelText: 'Email',
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

