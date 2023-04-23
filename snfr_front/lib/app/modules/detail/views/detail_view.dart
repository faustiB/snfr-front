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
        title: Text(controller.shoe.value.title!, overflow: TextOverflow.fade),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          children: [
            Image.network(controller.shoe.value.image!),
            SizedBox(height: 40),
            Text(
              controller.shoe.value.price!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent.shade100,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                launchUrl(Uri.parse(controller.shoe.value.url!));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                width: 200,
                child: const Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
