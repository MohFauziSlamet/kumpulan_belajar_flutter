import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key  key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AnimatedContainer , membutuhkan bil random dari dart.math
  // digunakan untuk mengenered ukuran random dan warna random
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Animated Container"),
          centerTitle: true,
        ),
        body: Center(
          // GestureDetector digunakan untuk memberi event handler pada objek yang
          // tidak memilik event handler , agar dapat memilik eventhandler
          child: GestureDetector(
            onTap: () {
              // digunakan hanya untuk merefresh tampilan setalah di tap
              setState(() {});
            },
            child: AnimatedContainer(
              color: Color.fromARGB(
                255,
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
              ),
              // durasi animasi 1 detik
              duration: const Duration(seconds: 1),

              // lebar minimal 50 , dan maksimal 150
              width: 100.0 + random.nextInt(101),

              // tinggi minimal 50 , dan maksimal 150
              height: 100.0 + random.nextInt(101),
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );
  }
}
