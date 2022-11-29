import 'package:belajar_flutter/kuldi_projek/52.GETX/19.GetX%20Storage/controllers/authC.dart';
import 'package:belajar_flutter/kuldi_projek/52.GETX/19.GetX%20Storage/controllers/loginC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final auth = Get.find<AuthC>();
  final login = Get.find<LoginC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                auth.logout(login.rememberMe);
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
      ),
    );
  }
}
