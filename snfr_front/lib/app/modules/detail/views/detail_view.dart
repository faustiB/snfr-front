import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailView'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(controller.shoe.value.image!),
            SizedBox(height: 40),
            Text(
              controller.shoe.value.title!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent.shade200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              controller.shoe.value.price!,
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueAccent.shade100,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(controller.shoe.value.url!));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                  width: 200,
                  child: const Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            )
          ],
        ));
  }
}
