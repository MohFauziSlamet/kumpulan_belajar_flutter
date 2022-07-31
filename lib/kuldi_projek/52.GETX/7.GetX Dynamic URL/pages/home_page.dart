import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RouteNames.productPage);
          },
          child: Text('GO TO Product Page >>'),
        ),
      ),
    );
  }
}
