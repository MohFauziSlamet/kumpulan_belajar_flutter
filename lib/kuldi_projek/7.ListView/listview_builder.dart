import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Color> myColor = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.amber
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Latihan Listview"),
          ),
          body: ListView.builder(
            // listview.builder setidaknya membutuhkan 2 argumen , yaitu
            // itemCount dan itemBuilder
            // itemCount adl jumlah list yang mau dibuat

            // itemCount: 4, bisa diganti dengan seperti dibawah
            itemCount: myColor.length,

            // itemBuilder, membutuhkan sebuah fungsi
            itemBuilder: (contex, index) {
              return Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(color: myColor[index]),
              );
            },
            //listview secara default kearah vertical. atas bawah
            // jika  direction kearah vertical, maka widthnyaa (lebarnya)otomatis
            //sesuai dengan ukuran layar.
            // jika  direction kearah horizontal, maka heighnyaa (tingginya)otomatis
            //sesuai dengan ukuran layar.

            // scrollDirection membutuhkan widget axis
            scrollDirection: Axis.vertical,
          )),
    );
  }
}
