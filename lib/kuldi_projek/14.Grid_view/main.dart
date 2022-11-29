import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Container> myContainer = List.generate(
    10,
    (index) {
      return Container(
        color: Color.fromARGB(
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
        ),
      );
    },
  );
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Gridview"),
          centerTitle: true,
        ),
        body: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 5 / 5,
              // jumlah  kolom grid view
              crossAxisCount: 2,

              // jarak kiri kanan
              crossAxisSpacing: 20,

              // jarak atas bawah
              mainAxisSpacing: 20),
          children: myContainer,
        ),
      ),
    );
  }
}
