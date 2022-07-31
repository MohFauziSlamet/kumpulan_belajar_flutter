import 'package:flutter/material.dart';

class RowColumnSpaceBetweenLogo extends StatelessWidget {
  const RowColumnSpaceBetweenLogo({
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
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ItemColumn(),
            ItemColumn(),
            ItemColumn(),
            ItemColumn(),
          ],
        ),
      ),
    );
  }
}

class ItemColumn extends StatelessWidget {
  const ItemColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 150,
          height: 150,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 150,
          height: 150,
          color: Colors.amber,
          child: const Center(
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
