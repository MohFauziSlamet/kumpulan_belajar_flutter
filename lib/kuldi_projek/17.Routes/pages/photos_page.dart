import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  // agar tidak lupa dalam penamaan routes
  // kita bisa membuat initial nama halaman screennya terlebih dahulu
  static const nameRoute = '/photosPage';

  const PhotosPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos Page"),
      ),
      body: const Center(
        child: Text(
          "Photos Page",
          style: TextStyle(fontSize: 40),
        ),
      ),

      // floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.keyboard_arrow_left,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
