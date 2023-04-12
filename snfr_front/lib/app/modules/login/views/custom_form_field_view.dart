import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/custom_form_field_controller_controller.dart';

class CustomFormFieldView extends GetView<CustomFormFieldControllerController> {
  CustomFormFieldView({
    Key? key,
    required this.margins,
    required this.labelText,
    this.isPassword = false,
    this.isEmail = false,
  }) : super(key: key);
  final EdgeInsets margins;
  bool isPassword;
  bool isEmail;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margins,
      child: TextFormField(
        obscureText: isPassword,
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
            if (value!.length > 6) {
              return null;
            } else {
              return 'Password must be at least 6 characters';
            }
          }
        return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
