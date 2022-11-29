
import 'package:belajar_flutter/kuldi_projek/54.%20Animated%20Builder/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Product'),
        centerTitle: true,
      ),
      body: Center(
        child: FadeTransition(
          opacity: controller.animationController,
          child: Container(
            width: context.width * 0.4,
            height: context.width * 0.4,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
