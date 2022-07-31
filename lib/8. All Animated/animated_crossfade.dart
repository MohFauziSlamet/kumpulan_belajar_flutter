import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
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
  RxBool clik = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated CrossFade"),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => GestureDetector(
              onTap: () {
                clik.toggle();
              },
              child: AnimatedCrossFade(
                firstChild: Container(
                  width: Get.width * 0.5,
                  height: Get.width * 0.5,
                  color: Colors.amber,
                  child: Image.asset(
                    "assets/images/mauludy.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                secondChild: Container(
                  width: Get.width * 0.5,
                  height: Get.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      "assets/images/mauludy.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                crossFadeState: clik.isTrue
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 1),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clik.toggle();
        },
      ),
    );
  }
}
