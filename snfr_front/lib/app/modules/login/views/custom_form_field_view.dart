import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snfr_front/app/modules/signup/controllers/signup_controller.dart';

import '../controllers/custom_form_field_controller_controller.dart';

class CustomFormFieldView extends GetView<CustomFormFieldControllerController> {

  final EdgeInsets margins;
  final bool isPassword;
  final bool isEmail;
  final String labelText;
  //Controllers
  final signUpController = Get.find<SignupController>();
  final TextEditingController textEditingController;
  CustomFormFieldView({
    Key? key,
    required this.margins,
    required this.labelText,
    required this.textEditingController,
    this.isPassword = false,
    this.isEmail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margins,
      child: TextFormField(
        obscureText: isPassword,
        controller: textEditingController,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
        if (isEmail) {
            if (GetUtils.isEmail(value!)) {
              return null;
            } else {
              return 'Invalid email';
            }
          }
        if (isPassword) {
          //Todo : maybe abstract in controller.
            if (value!.length < 6 ) {
              return 'Password must be at least 6 characters';
            } else if (GetUtils.isAlphabetOnly(value)) {
              return 'Passwords must include a number';
            } else if (GetUtils.isNumericOnly(value)) {
              return 'Passwords must include a letter';
            } else if (!GetUtils.hasCapitalletter(value)) {
              return 'Password must include a capital letter';
            }
          }
        return null;
        },
        onChanged: (value) {
          if (isEmail) {
            signUpController.email.value = value;
          }
          if (isPassword) {
            signUpController.password.value = value;
            signUpController.confirmPassword.value = value;
          }
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
