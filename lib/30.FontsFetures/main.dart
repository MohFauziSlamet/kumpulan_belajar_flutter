import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fonts Features"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Contoh 1 (Tanpa Apapun)", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
