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
  RxBool clikContainer = false.obs;
  RxBool clikLogo = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated CrossFade"),
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
                  duration: Duration(seconds: 1),
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
                  duration: Duration(seconds: 1),
                  child: FlutterLogo(
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
