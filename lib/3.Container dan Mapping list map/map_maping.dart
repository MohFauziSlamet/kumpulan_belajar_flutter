import 'dart:math';

import 'package:flutter/material.dart';
import './widget/kotak_warna.dart';

void main(List<String> args) {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  ListApp({Key? key}) : super(key: key);

  // membuat list of Map
  // list yang berisi data mapping.
  // color , kita ambil dari data random , yang ada pada dart math.
  final List<Map<String, dynamic>> data = List.generate(20, (index) {
    return {
      'text': "Kotak - ${index + 1}",
      'color': Color.fromARGB(
        255,
        250 + Random().nextInt(256),
        250 + Random().nextInt(256),
        250 + Random().nextInt(256),
      ),
    };
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
              // karena list data belum berupa list of widget
              // kita harus melakukan maping data lalu merubah nya ke bentuk widget class
              // setelah itu ikta ubah lagi menjadi list , sehingga menjadi list of widget
              children: data.map(
                (atributData) {
                  return KotakWarna(
                    warna: atributData["color"],
                    textItem: atributData["text"],
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
