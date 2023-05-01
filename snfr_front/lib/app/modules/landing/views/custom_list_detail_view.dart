import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListDetailView extends GetView {
  String img, title, price;

  CustomListDetailView({
    Key? key,
    required this.img,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(img),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent.shade200,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: TextStyle(
              fontSize: 12,
              color: Colors.blueAccent.shade100,
            ),
          ),
        ],
      ),
    );
  }
}
