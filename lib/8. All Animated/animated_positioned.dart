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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: clikContainer.isTrue ? 0.2 : 1,
              child: Container(
                width: context.width * 0.6,
                height: context.width * 0.6,
                color: Colors.amber,
                child: const Center(
                  child: Text(
                    'Mauludy',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(seconds: 1),
                top: clikLogo.isTrue ? 80 : 120,
                left: 75,
                child: Container(
                  width: context.width * 0.3,
                  height: context.width * 0.1,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clikLogo.toggle();
          // clikContainer.toggle();
        },
      ),
    );
  }
}
