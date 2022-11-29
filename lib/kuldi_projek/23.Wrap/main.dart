import 'package:flutter/material.dart';

/// catatan
/// wrap : berfungsi untuk mencegah overflow.
/// ketika terdapat sebuah kontainer yang jumlah nya sudah melebihi width device atau
/// height device. maka kontainer tersebut akan otomatis dipindahkan ke bawah ,
/// mirip seperti urutan zigzag.
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Latihan Wrap",
        ),
        centerTitle: true,
      ),
      body: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
