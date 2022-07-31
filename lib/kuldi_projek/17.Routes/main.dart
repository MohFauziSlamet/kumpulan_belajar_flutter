import 'package:belajar_flutter/kuldi_projek/17.Routes/pages/gallery_page.dart';
import 'package:belajar_flutter/kuldi_projek/17.Routes/pages/home_page.dart';
import 'package:belajar_flutter/kuldi_projek/17.Routes/pages/photos_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),

      // screen yang akan dipanggil pertama kali
      initialRoute: HomePage.nameRoute,

      // routes adalah cara lain untuk melakukan navigasi antar screen
      routes: {
        HomePage.nameRoute: (context) => HomePage(),
        GalleryPage.nameRoute: (context) => GalleryPage(),
        PhotosPage.nameRoute: (context) => PhotosPage(),
      },
    );
  }
}
