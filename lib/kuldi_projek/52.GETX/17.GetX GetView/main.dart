import './bindings/myB.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/home_page.dart';
import 'controller/myC.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myC = Get.put(MyC());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyB(),
      home: HomePage(),
    );
  }
}
