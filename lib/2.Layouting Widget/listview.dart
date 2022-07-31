import 'package:flutter/material.dart';

//  jika listview tidak memiliki widget layouting lagi
// maka width dan height , dipengaruhi dengan scrollDirectionnya
// jika scrollDirection bernilai Axis.vertical (atas bawah) , maka
// widthnya akan infinity (sesuai lebar layar)
// jika scrollDirection bernilai Axis.horizontal (kiri kanan) , maka
// height akan infinity (sesuai tinggi layar)
void main(List<String> args) {
  runApp(ListviewApp());
}

class ListviewApp extends StatelessWidget {
  const ListviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan Listview'),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          // scrollDirection: Axis.vertical,
          children: [
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('Container 1'),
            ),
            ContainerItem(
              warna: Colors.amber.shade300,
              textItem: Text('Container 2'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('Container 3'),
            ),
            ContainerItem(
              warna: Colors.amber.shade300,
              textItem: Text('Container 4'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('Container 1'),
            ),
            ContainerItem(
              warna: Colors.amber.shade300,
              textItem: Text('Container 5'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('Container 6'),
            ),
            ContainerItem(
              warna: Colors.amber.shade300,
              textItem: Text('Container 7'),
            ),
            ContainerItem(
              warna: Colors.amber,
              textItem: Text('Container 8'),
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
      width: 100,
      height: 100,
      color: warna,
      child: Center(
        child: textItem,
      ),
    );
  }
}
