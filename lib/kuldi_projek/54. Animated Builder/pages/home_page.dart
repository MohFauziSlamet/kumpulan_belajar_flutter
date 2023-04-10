import 'dart:math';

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
        child: AnimatedBuilder(
          animation: controller.animationController,
          child: Container(
            height: 70,
            width: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          builder: (context, child) {
            return Transform.rotate(
              // offset: Offset(controller.animationController.value * 2, -100),
              // scale: controller.animationController.value * 2, // Transform.scale
              angle: controller.animationController.value * 2 * pi, // Transform.rotate
              child: child,
            );
          },
        ),
      ),
    );
  }
}
