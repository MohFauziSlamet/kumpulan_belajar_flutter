import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageEmpat extends StatelessWidget {
  const PageEmpat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Empat'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('<< BACK TO PAGE TIGA'),
        ),
      ),
    );
  }
}
