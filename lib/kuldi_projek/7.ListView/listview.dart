import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> myListview = [
      Container(
        // height: 300,
        width: 300,
        decoration: BoxDecoration(color: Colors.red),
      ),
      Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(color: Colors.green),
      ),
      Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(color: Colors.blue),
      ),
      Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(color: Colors.amber),
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Listview"),
        ),
        body: ListView(
          //listview secara default kearah vertical. atas bawah
          // jika  direction kearah vertical, maka widthnyaa (lebarnya)otomatis
          //sesuai dengan ukuran layar.
          // jika  direction kearah horizontal, maka heighnyaa (tingginya)otomatis
          //sesuai dengan ukuran layar.

          // scrollDirection membutuhkan widget axis
          scrollDirection: Axis.horizontal,
          children: myListview,
        ),
      ),
    );
  }
}
