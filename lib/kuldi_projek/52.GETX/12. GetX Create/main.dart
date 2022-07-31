import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'package:get/get.dart';

// catatan
// Get.create : digunakan untuk membuat controller lebih dari 1 dari clas yang sama

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
