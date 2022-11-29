import 'package:belajar_flutter/kuldi_projek/20.Model/pages/home_page_model.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageModel(),
    );
  }
}
