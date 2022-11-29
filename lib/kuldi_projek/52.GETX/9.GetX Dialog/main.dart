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
        title: const Text('Get Dialog'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Ini judul dialog',
            middleText: 'ini isi dialog',
            textCancel: 'Batal',
            textConfirm: 'OKE',
            onConfirm: () {
              Get.back();
              Get.snackbar("OKE", "Sukses");
            },
            onCancel: () {
              Get.back();
            },
          );
        },
      ),
    );
  }
}
