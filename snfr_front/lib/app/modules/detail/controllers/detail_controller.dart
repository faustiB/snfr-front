import 'package:get/get.dart';

import '../../landing/shoe_model.dart';

class DetailController extends GetxController {

  final shoe = Shoe().obs;

  @override
  void onInit() {
    fillShoe();
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

  fillShoe() {
    shoe.value = Get.arguments;
  }

}
