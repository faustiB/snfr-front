import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../shoe_model.dart';

class LandingController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxList<Shoe> shoes = <Shoe>[].obs;
  List<Shoe> allShoes = [];
  var orderAsc = true.obs;
  var showSearchBar = false.obs;

  @override
  void onInit() async {
    await getShoes();
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

  Future<List<Shoe>> getShoes() async {
    try {
      shoes.value = [];
      var priceDouble = 0.0;
      var shoe = Shoe();
      final snapshot = await FirebaseFirestore.instance.collection('shoes').get();
      for (var doc in snapshot.docs) {
        shoe = Shoe.fromJson(doc.data());
        priceDouble = double.parse(shoe.price!.split('€')[0].replaceAll(",", "."));
        shoe.priceDouble = priceDouble;
        shoes.add(shoe);
      }

      for (var i = 0; i < shoes.length; i++) {
        for (var j = i + 1; j < shoes.length; j++) {
          if (shoes[i].title == shoes[j].title &&
              shoes[i].price == shoes[j].price &&
              shoes[i].image == shoes[j].image &&
              shoes[i].url == shoes[j].url) {
            shoes.removeAt(j);
          }
        }
      }

      shoes.sort((a, b) => a.priceDouble!.compareTo(b.priceDouble!));
      allShoes = shoes;
      print(shoes.length);
    } catch (e) {
      print(e);
    }
    return shoes;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
    }
  }

  filterShoes(String query) async {
      shoes.value = shoes.where((shoe) => shoe.title!.toLowerCase().contains(query.toLowerCase())).toList();
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

  changeOrder() {
    if (orderAsc.value) {
      orderAsc.value = false;
      orderDesc();
    } else {
      orderAsc.value = true;
      orderAscend();
    }
  }

  orderDesc() {
    shoes.sort((a, b) => b.priceDouble!.compareTo(a.priceDouble!));
  }

  orderAscend() {
    shoes.sort((a, b) => a.priceDouble!.compareTo(b.priceDouble!));
  }

  showSearchBarInView() {
    print(showSearchBar.value);
    if (showSearchBar.value) {
      showSearchBar.value = false;
    } else {
      showSearchBar.value = true;
    }
  }
}
