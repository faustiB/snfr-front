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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChangeOrderButton(controller: controller),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                      controller.showSearchBarInView();
                    },
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () {
                return Visibility(
                  visible: controller.showSearchBar.value,
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        /*if (value.isEmpty) {
                          controller.shoes.value = controller.allShoes;
                        } else {
                          controller.filterShoes(value);
                        }*/
                      },
                    ),
                  ),
                );
              },
            ),
            Obx(
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
          ],
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

class ChangeOrderButton extends StatelessWidget {
  const ChangeOrderButton({
    super.key,
    required this.controller,
  });

  final LandingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
        ),
        onPressed: () {
          controller.changeOrder();
        },
        child: Obx(
          () {
            return Text(
              controller.orderAsc.value ? 'Order Descending' : 'Order Ascending',
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
