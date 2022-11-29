import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shop/shop.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home Page',
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              onPressed: () => Get.to(() => ShopPage()),
              child: const Text(
                'Shop >>',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
