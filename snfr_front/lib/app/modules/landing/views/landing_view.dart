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
          child: Obx(() {
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
                      child: ListTile(
                          title: Text(
                            controller.shoes.value[index].title!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent.shade200,
                            ),
                          ),
                          subtitle: Text(
                            controller.shoes.value[index].price!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blueAccent.shade100,
                            ),
                          ),
                          leading: Image.network(
                            fit: BoxFit.fill,
                            controller.shoes.value[index].image!,
                          ),
                          trailing: const Icon(
                            //TODO: Maybe put the icon of shop ?
                            Icons.shopping_cart_outlined,
                            color: Colors.blueAccent,
                          )
                      ),
                      borderOnForeground: true,
                    ),
                    onTap: () {
                      //TODO: Move this to detail page of item.
                      launchUrl(Uri.parse(controller.shoes[index].url!));
                    },
                  );
                },
              );
            }
          )
        ));
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
