import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:snfr_front/app/modules/login/views/signin_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninView()
    );
  }
}
