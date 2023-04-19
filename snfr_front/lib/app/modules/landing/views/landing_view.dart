import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/landing_controller.dart';

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
        title: const Text('SneakerFinder'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.menu_rounded),
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
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.shoes.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Card(
                child: ListTile(
                  title: Text(controller.shoes[index].title!),
                  subtitle: Text(controller.shoes[index].price!),
                  leading: Image.network(controller.shoes[index].image!),
                ),
                borderOnForeground: true,
              ),
              onTap: () {
                //TODO: Move this to detail page of item.
                launchUrl(Uri.parse(controller.shoes[index].url!));
              },
            );
          },
        ),
      )
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
