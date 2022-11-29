import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

class PageTiga extends StatelessWidget {
  const PageTiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Tiga'),
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
              child: const Text('<< BACK TO PAGE DUA'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteNames.page_4);
              },
              child: const Text('GO TO PAGE EMPAT >>'),
            ),
          ],
        ),
      ),
    );
  }
}
