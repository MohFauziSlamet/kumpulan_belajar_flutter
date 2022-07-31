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
  runApp(GridviewApp());
}

class GridviewApp extends StatelessWidget {
  const GridviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan Gridview Fixed Count'),
        ),
        body: GridView(
          // dengan memasukan jumlah grid nya
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          scrollDirection: Axis.vertical,
          // scrollDirection: Axis.horizontal,
          children: [
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('5'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('5'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('5'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('1'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('3'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('5'),
            ),
          ],
        ),
      ),
    );
  }
}

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
      margin: EdgeInsets.all(10),
      color: warna,
      child: Center(
        child: textItem,
      ),
    );
  }
}
