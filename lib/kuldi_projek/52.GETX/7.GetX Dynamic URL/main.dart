import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './routes/page_route.dart';

// catatan
// Get.to() : sama dengan Navigator.of(context).push()
// Get.off() : sama dengan Navigator.of(context).pushReplacement()
// Get.offAll() : sama dengan Navigator.of(context).pushReplacementAndRemoweUntil()
// Get.back() : sama dengan Navigator.of(context).pop()

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: AppPageRoute.pages);
  }
}
