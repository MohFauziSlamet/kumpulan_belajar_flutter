import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: 18,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(RouteNames.DetailScreen, arguments: index + 500);
              },
              child: Hero(
                /// tag harus unix . tag gambar 1 dengan gambar lainnya harus berbeda
                /// jadi 1 tag hanya untuk 1 objek tujuan.
                /// shg disini untuk membedakan tiap tag , kita menggunakan index
                tag: '${index + 500}', transitionOnUserGestures: true,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        "https://picsum.photos/id/${index + 500}/1000")),
              ),
            );
          },
        ),
      ),
    );
  }
}
