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
          children: [
            Image.network(controller.shoe.value.image!),
            Text(controller.shoe.value.title!),
            Text(controller.shoe.value.price!),
            Container(
                color: Colors.lightBlueAccent,
                child: InkWell(
                    child: const Text('Buy'),
                    onTap: () {
                      launchUrl(Uri.parse(controller.shoe.value.url!));
                    }
                )
            )
          ],
        )
    );

  }
}
