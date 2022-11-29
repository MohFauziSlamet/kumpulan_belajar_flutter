import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routes/app_page.dart';
import './pages/home/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      getPages: AppPages.routePages,
    );
  }
}
