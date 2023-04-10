// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  RxBool clikContainer = false.obs;
  RxBool clikLogo = false.obs;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated CrossFade"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  clikContainer.toggle();
                },
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: clikContainer.isTrue ? 0.2 : 1,
                  child: Container(
                    width: context.width * 0.4,
                    height: context.width * 0.4,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  clikLogo.toggle();
                },
                child: AnimatedOpacity(
                  opacity: clikLogo.isTrue ? 0.2 : 1,
                  duration: const Duration(seconds: 1),
                  child: const FlutterLogo(
                    size: 250,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
