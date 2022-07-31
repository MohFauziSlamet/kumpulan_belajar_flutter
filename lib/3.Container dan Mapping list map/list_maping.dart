import 'dart:math';

import 'package:flutter/material.dart';
import './widget/kotak_warna.dart';

void main(List<String> args) {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  ListApp({Key? key}) : super(key: key);

  // list.generate : digunakan untuk membuat list dengan jumlah yang sudah ditentukan.
  // warna di ambil random , kita butuh dart.math untuk mengenarated nilai secara random .
  final List<KotakWarna> allItems = List.generate(20, (index) {
    return KotakWarna(
      warna: Color.fromARGB(
        255,
        250 + Random().nextInt(256),
        250 + Random().nextInt(256),
        250 + Random().nextInt(256),
      ),
      textItem: 'Kotak ke ${index + 1}',
    );
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan mapping list'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // karena allItems sudah berbentuk list of widget (list<kotak_warna>)
              // ia dapat langsung dimasukan kedalam children
              children: allItems,
            ),
          ),
        ),
      ),
    );
  }
}
