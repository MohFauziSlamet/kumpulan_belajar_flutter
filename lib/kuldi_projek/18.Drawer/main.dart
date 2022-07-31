import 'package:belajar_flutter/kuldi_projek/18.Drawer/pages/home_page_drawer.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageDrawer(),
    );
  }
}
