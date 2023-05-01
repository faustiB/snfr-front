import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/landing_controller.dart';
import 'custom_list_detail_view.dart';

class LandingView extends GetView<LandingController> {
  LandingView({Key? key}) : super(key: key);
  final List<String> _menuItems = [
    'Profile',
    'Settings',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'SneakerFinder',
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.blueAccent,
            ),
            itemBuilder: (BuildContext context) {
              return _menuItems.map((String menuItem) {
                return PopupMenuItem(
                  value: menuItem,
                  child: Row(
                    children: [
                      Icon(controller.getIconName(menuItem), color: Colors.blueAccent),
                      const SizedBox(width: 10),
                      Text(menuItem),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (menuItem) async {
              await handleOnPress(menuItem);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.shoes.value.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Card(
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                    ),
                    elevation: 8,
                    shadowColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CustomListDetailView(
                      img: controller.shoes[index].image!,
                      title: controller.shoes[index].title!,
                      price: controller.shoes[index].price!,
                    ),
                    borderOnForeground: true,
                  ),
                  onTap: () {
                    //TODO: Move this to detail page of item.
                    Get.toNamed(Routes.DETAIL, arguments: controller.shoes[index]);
                    //launchUrl(Uri.parse(controller.shoes[index].url!));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> handleOnPress(String menuItem) async {
    switch (menuItem) {
      case 'Profile':
        print('Profile');
        break;
      case 'Settings':
        print('Settings');
        await controller.getShoes();
        break;
      case 'Logout':
        await controller.signOut();
        Get.snackbar(
          'See you soon!',
          'You have been logged out',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueAccent,
          colorText: Colors.white,
        );
        Get.offAllNamed('/login');
        break;
    }
  }
}
