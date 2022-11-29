import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/my_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myC = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Worker"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              myC.reset();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Terjadi perubahaan : ${myC.count} X',
                  style: const TextStyle(fontSize: 25),
                )),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => myC.change(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
