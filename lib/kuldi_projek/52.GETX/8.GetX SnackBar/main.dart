import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Snacbar'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            'Ini adalah judul',
            'Ini ada pesannya',
            titleText: const Text(
              'ini tittle tambahan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: const Text(
              'ini pesannya',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            barBlur: 7,
            animationDuration: const Duration(seconds: 2),
            forwardAnimationCurve: Curves.linearToEaseOut,
            backgroundColor: Colors.green[800],
            snackPosition: SnackPosition.TOP,
          );
        },
      ),
    );
  }
}
