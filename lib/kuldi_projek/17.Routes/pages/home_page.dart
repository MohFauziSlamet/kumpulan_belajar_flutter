import 'package:belajar_flutter/kuldi_projek/17.Routes/pages/gallery_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // agar tidak lupa dalam penamaan routes
  // kita bisa membuat initial nama halaman screennya terlebih dahulu
  static const nameRoute = '/homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Center(
        child: Text(
          "Home Page",
          style: TextStyle(fontSize: 40),
        ),
      ),

      // floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(GalleryPage.nameRoute);
        },
        child: const Icon(Icons.keyboard_arrow_right),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
