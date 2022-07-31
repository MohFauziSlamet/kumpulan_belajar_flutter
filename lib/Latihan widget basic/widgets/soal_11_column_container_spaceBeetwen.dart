import 'package:flutter/material.dart';

class ColumnContainerSpaceBetween extends StatelessWidget {
  const ColumnContainerSpaceBetween({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        leading: const FlutterLogo(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Hello',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.amber,
            child: const Center(
              child: Text(
                'Hello',
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
