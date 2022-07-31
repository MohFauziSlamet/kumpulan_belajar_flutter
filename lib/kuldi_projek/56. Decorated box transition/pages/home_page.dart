import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decorated Box Transition'),
        centerTitle: true,
      ),
      body: Center(
        child: DecoratedBoxTransition(
          decoration: controller.decorationTween
              .animate(controller.animationController),
          child: Container(
            width: context.width * 0.5,
            height: context.width * 0.5,
            padding: EdgeInsets.all(20),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
