import 'package:flutter/material.dart';

class ColumnEmpatContainerSpaceBetween extends StatelessWidget {
  const ColumnEmpatContainerSpaceBetween({
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
          children: const [
            ItemRow(
              colorContainer1: Colors.blue,
              colorContainer2: Colors.amber,
            ),
            SizedBox(width: 20),
            ItemRow(
              colorContainer1: Colors.amber,
              colorContainer2: Colors.blue,
            ),
          ],
        ));
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({
    Key? key,
    required this.colorContainer1,
    required this.colorContainer2,
  }) : super(key: key);

  final Color colorContainer1;
  final Color colorContainer2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          color: colorContainer1,
          child: const Center(
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: 200,
          height: 200,
          color: colorContainer2,
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
