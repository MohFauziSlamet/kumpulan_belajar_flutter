import 'package:flutter/material.dart';

import 'colorfull_button.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Button Belah Ketupat"),
        ),
        // penambahan Center agar widget berada ditengah
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ColorfullButton(Colors.amber, Colors.blue, Icons.adb),
              ColorfullButton(Colors.pink, Colors.green, Icons.contact_phone),
              ColorfullButton(Colors.purple, Colors.red, Icons.settings),
              ColorfullButton(Colors.red, Colors.blue, Icons.comment),
              ColorfullButton(Colors.blue, Colors.purple, Icons.email),
            ],
          ),
        ),
      ),
    );
  }
}
