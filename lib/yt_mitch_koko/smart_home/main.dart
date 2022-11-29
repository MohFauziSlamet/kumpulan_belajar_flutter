import 'package:flutter/material.dart';
import 'pages/home/ui/home_view.dart';

void main(List<String> args) {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
