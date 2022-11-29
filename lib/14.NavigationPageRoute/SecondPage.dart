import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
