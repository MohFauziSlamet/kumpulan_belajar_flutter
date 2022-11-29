import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/myC.dart';

// catatan
// ketika menggunakan extends GetView , kita tidak memakai StatelessWidget
// melainkan langsung extends ke GetView. didalam GetView sudah mengextends
// StatelessWidget.
// pemnggunaan GetView<MyC> harus di isi nama controllernya.
// pemnggunaan GetView sama dengan StatelessWidget yang ditambahkan get.find()
// jadi ketika menggunakan GetView, kita tidak perlu menggunakan Get.find().

// namun kekekurangan dari GetView , ia hanya bisa menggunakan 1 controller saja
class HomePage extends GetView<MyC> {
  // final myCHomePage = Get.find<MyC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              '${controller.nilai}',
              style: const TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (controller.nilai != 0) {
                    controller.mines();
                  } else {
                    print("tidak ada apa apa");
                  }
                },
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.add();
                },
                child: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
