import 'package:flutter/material.dart';

// catatan :
// didalam GridView yang menggunakan
// SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
// name argumen width dan heght tidak dapat digunakan
// ukuran nya akan menyesuaikan dengan jumlah grid yang diinginkan
// serta akan menyesuilan dengan ukuran layar

// didalam grid view sudah memiliki scrollDirection
// jika scrollDirection.Axis.vertical(atas bawah) , maka widget akan di buat 3 kesamping
// jika scrollDirection.Axis.horizontal(kiri kanan) , maka widget akan di buat 3 atas bawah
void main(List<String> args) {
  runApp(const GridviewApp());
}

class GridviewApp extends StatelessWidget {
  const GridviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Gridview Max axis.extend'),
        ),
        body: GridView(
          // dengan memasukan maximum lebar dan tinggi nya sama
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400),

          scrollDirection: Axis.vertical,
          // scrollDirection: Axis.horizontal,
          children: [
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('5'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('5'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('5'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: const Text('5'),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ContainerItem extends StatelessWidget {
  Color warna;
  Text textItem;

  ContainerItem({
    Key? key,
    required this.warna,
    required this.textItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: warna,
      child: Center(
        child: textItem,
      ),
    );
  }
}
