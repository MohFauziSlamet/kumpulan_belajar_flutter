import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

class PageDua extends StatelessWidget {
  const PageDua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Dua'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('<< BACK TO PAGE SATU'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  RouteNames.page_3,
                );
              },
              child: const Text('GO TO PAGE TIGA >>'),
            ),
          ],
        ),
      ),
    );
  }
}
