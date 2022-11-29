import 'package:flutter/material.dart';
import 'SecondPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Go To Second Page'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              }));
            }),
      ),
    );
  }
}
