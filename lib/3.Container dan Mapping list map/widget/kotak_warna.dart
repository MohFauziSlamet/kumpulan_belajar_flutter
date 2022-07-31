import 'package:flutter/material.dart';

class KotakWarna extends StatelessWidget {
  final Color warna;
  final String textItem;

  const KotakWarna({
    Key? key,
    required this.warna,
    required this.textItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      color: warna,
      child: Center(
        child: Text(
          textItem,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
