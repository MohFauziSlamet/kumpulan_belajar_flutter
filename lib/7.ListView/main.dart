import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Color> myColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Listveiw"),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              height: 18,
              color: Colors.purple,
            );
          },
          //itemCount jumlah list yang mau dibuat
          itemCount: myColor.length,
          //itemBuilder membutuhkan function sbg argumennya , dengan nama
          // ignore: non_constant_identifier_names
          itemBuilder: (BuildContext BuildContext, index) {
            return Container(
              color: myColor[index],
              height: 300,
            );
          },
        ),
      ),
    );
  }
}
