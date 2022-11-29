// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BasicWidget extends StatefulWidget {
  const BasicWidget({Key? key}) : super(key: key);

  @override
  _BasicWidgetState createState() => _BasicWidgetState();
}

class _BasicWidgetState extends State<BasicWidget> {
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildText(),
              const SizedBox(height: 32),
              buildFittedHeightText(),
              const SizedBox(height: 32),
              buildFittedWidthText(),
            ],
          ),
        ),
      );

  Widget buildText() => const Text(
        'This Is A Normal Text',
        style: TextStyle(fontSize: 64),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget buildFittedHeightText() => Container(
        color: Colors.red,
        height: 100,
        child: const FittedBox(
          child: Text('This Text Is Responsive'),
        ),
      );

  Widget buildFittedWidthText() => Container(
        color: Colors.blue,
        width: MediaQuery.of(context).size.width * 0.5,
        child: const FittedBox(
          child: Text('This Text Is Responsive'),
        ),
      );
}
