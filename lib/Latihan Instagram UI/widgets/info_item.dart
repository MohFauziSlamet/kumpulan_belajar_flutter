import 'package:flutter/material.dart';

class InforamsiItem extends StatelessWidget {
  InforamsiItem({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: const TextStyle(
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
