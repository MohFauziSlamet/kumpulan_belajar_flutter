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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.obx(
              (state) => Column(
                children: [
                  Text(
                    "ID : ${state!['id']}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Email : ${state['email']}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Nama Lengkap : ${state['first_name']} ${state['last_name']}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Image.network("${state['avatar']}"),
                ],
              ),
              // widget yang akan ditampilkan ketika state masih loading
              onLoading: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.amber,
                ),
              ),
              onEmpty: const Text(
                'Belum ada data...',
                style: TextStyle(fontSize: 25),
              ),
              onError: (error) => Text(
                error.toString(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getData();
        },
      ),
    );
  }
}
