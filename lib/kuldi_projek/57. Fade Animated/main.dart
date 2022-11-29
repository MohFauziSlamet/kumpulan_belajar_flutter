import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routes/page_route.dart';
import './pages/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      getPages: AppPageRoute.pages,
    );
  }
}
