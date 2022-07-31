import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/3.Container dan Mapping list map/widget/kotak_warna.dart';

void main(List<String> args) {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  ListApp({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> database = List.generate(40, (index) {
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
          title: const Text('listview builder'),
        ),
        // pilih salah satu
        // body: const ListviewBuilder(), // memanggil ListviewBuilder
        // body: const GridviewBuilder(), // memanggil GridviewBuilder
        // body: GridviewCount(datagridview: database), // memanggil GridviewCount
        body: GridView.custom(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            childrenDelegate: SliverChildListDelegate.fixed(
              database
                  .map(
                    (e) => KotakWarna(
                      warna: e['color'],
                      textItem: e['text'],
                    ),
                  )
                  .toList(),
            )),
      ),
    );
  }
}

// latihan list gridviewbuilder
class GridviewCount extends StatelessWidget {
  const GridviewCount({
    Key? key,
    required this.datagridview,
  }) : super(key: key);

  final List<Map<String, dynamic>> datagridview;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: datagridview
          .map((e) => KotakWarna(warna: e['color'], textItem: e['text']))
          .toList(),
    );
  }
}

// latihan list gridviewbuilder
class GridviewBuilder extends StatelessWidget {
  const GridviewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 40,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return KotakWarna(
            warna: Color.fromARGB(
              255,
              150 + Random().nextInt(256),
              150 + Random().nextInt(256),
              150 + Random().nextInt(256),
            ),
            textItem: 'kotak ke - ${index + 1}');
      },
    );
  }
}

// latihan list viewbuilder
class ListviewBuilder extends StatelessWidget {
  const ListviewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return KotakWarna(
            warna: Color.fromARGB(
              255,
              150 + Random().nextInt(256),
              150 + Random().nextInt(256),
              150 + Random().nextInt(256),
            ),
            textItem: 'kotak ke - ${index + 1}');
      },
    );
  }
}
