import 'dart:math';
import 'package:flutter/material.dart';

class FlutterLogoLatihanCustom extends StatelessWidget {
  const FlutterLogoLatihanCustom({
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
      body: Center(
        child: Transform.rotate(
          // pi : bernilai 180 ,
          // namun untuk merubahanya tidak bisa langsung dibagi
          // nilai 90 yang akan dijadikan derajatnya
          // 90 derata : pi / (180 / 90),
          angle: pi / (180 / 90),
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
