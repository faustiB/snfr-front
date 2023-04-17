import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shoe_model.dart';

class LandingController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Shoe> shoes = [];

  @override
  void onInit() {
    getShoes();
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

  //retrieve all from collection shoes in firebase
  Future<List<Shoe>> getShoes() async {
    try {
      shoes = [];
      final snapshot = await FirebaseFirestore.instance.collection('shoes').get();
      for (var doc in snapshot.docs) {
        print(Shoe.fromJson(doc.data()).title);
        shoes.add(Shoe.fromJson(doc.data()));
      }
      //Remove the € sign, cast it to int , and then sort the array from lowest to highest
      //TODO: Sort the array from lowest to highest maybe handle the price in back?
      print(shoes.length);
    } catch (e) {
      print(e);
    }
    return shoes;
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
