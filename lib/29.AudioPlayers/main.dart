import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String durasi = "00.00.00";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Playing Music"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Play")),
              ElevatedButton(onPressed: () {}, child: const Text("Pause")),
              ElevatedButton(onPressed: () {}, child: const Text("Stop")),
              ElevatedButton(onPressed: () {}, child: const Text("Resume")),
              Text(
                durasi,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
