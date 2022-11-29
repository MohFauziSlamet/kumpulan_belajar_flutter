import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AnimatedContainer , membutuhkan bil random dari dart.math
  // digunakan untuk mengenered ukuran random dan warna random
  Random random = Random();
  bool click = false;
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
            onTap: () => setState(() {}),
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              color: Color.fromARGB(
                255,
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
              ),

              // lebar minimal 50 , dan maksimal 150
              width: 100.0 + random.nextInt(101),

              // tinggi minimal 50 , dan maksimal 150
              height: 100.0 + random.nextInt(101),
              child: AnimatedAlign(
                alignment: click ? Alignment.topLeft : Alignment.bottomRight,
                duration: const Duration(seconds: 2),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      click = !click;
                    });
                  },
                  child: const Icon(
                    Icons.account_box_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
