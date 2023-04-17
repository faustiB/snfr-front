import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      print(e);
    }
  }

  IconData getIconName(String menuItem) {
    switch (menuItem) {
      case 'Profile':
        return Icons.person_outline_rounded;
      case 'Settings':
        return Icons.settings;
      case 'Logout':
        return Icons.logout_outlined;
      default:
        return Icons.menu;
    }
  }

}
