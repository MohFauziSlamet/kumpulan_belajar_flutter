import './pages/counter_page.dart';
import './pages/other_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
      routes: {
        CounterPage.routName: (context) => CounterPage(),
        OtherPage.routName: (context) => OtherPage(),
      },
    );
  }
}
