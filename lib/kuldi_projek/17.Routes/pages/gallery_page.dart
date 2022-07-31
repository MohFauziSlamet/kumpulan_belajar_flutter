import 'package:belajar_flutter/kuldi_projek/17.Routes/pages/photos_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  // agar tidak lupa dalam penamaan routes
  // kita bisa membuat initial nama halaman screennya terlebih dahulu
  static const nameRoute = '/galleryPage';

  const GalleryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Center(
            child: Text(
              "Gallery Page",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "<< BACK",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PhotosPage.nameRoute);
                },
                child: const Text(
                  "NEXT >>",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
