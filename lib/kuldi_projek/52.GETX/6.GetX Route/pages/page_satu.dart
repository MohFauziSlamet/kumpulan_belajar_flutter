import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

class PageSatu extends StatelessWidget {
  const PageSatu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Satu'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RouteNames.page_2);
          },
          child: Text('GO TO PAGE DUA >>'),
        ),
      ),
    );
  }
}
