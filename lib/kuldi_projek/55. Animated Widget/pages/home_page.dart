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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoxMuterMuter(controller.animationController),
            const SizedBox(height: 50),
            BoxMuterMuter(controller.animationController),
            const SizedBox(height: 50),
            BoxMuterMuter(controller.animationController),
          ],
        ),
      ),
    );
  }
}

class BoxMuterMuter extends AnimatedWidget {
  final animation;
  const BoxMuterMuter(this.animation) : super(listenable: animation);

  get progres => listenable as Animation<double>;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: progres.value * pi * 2,
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
        child: const Center(
          child: Text(
            "Hello",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
