import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Tracker',
      home: ShowCaseWidget(
        builder: Builder(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }
}
