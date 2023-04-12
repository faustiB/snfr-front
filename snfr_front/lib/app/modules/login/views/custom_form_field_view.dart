
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormFieldView extends GetView {

  CustomFormFieldView({
    Key? key,
    required this.margins,
    required this.labelText,
    this.isPassword = false,
  }) : super(key: key);
  final EdgeInsets margins;
  bool isPassword;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margins,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
