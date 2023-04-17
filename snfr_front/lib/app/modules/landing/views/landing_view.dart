import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              print(menuItem);
              switch (menuItem) {
                case 'Profile':
                  print('Profile');
                  break;
                case 'Settings':
                  print('Settings');
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
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'LandingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
