import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageDetails extends StatelessWidget {
  static const tag = "ImageDetails";
  @override
  Widget build(BuildContext context) {
    final String imageUrl = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Image.network(imageUrl)),
    );
  }
}
