import 'package:flutter/material.dart';

class ContaineTextCircle extends StatelessWidget {
  const ContaineTextCircle({
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
      body: const DenganBoxdecoration(),
      // body: const DenganClipOval(),
    );
  }
}

// dengan memanfaatkan widget ClipOval , untuk menjadikan container perseegi
// menjadi bentuk lingkaran
class DenganClipOval extends StatelessWidget {
  const DenganClipOval({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(200 / 2),
          ),
          child: const Center(
            child: Text(
              'Hello World',
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// dengan memanfaatkan properti decoration -> BorderRadius, untuk menjadikan container perseegi
// menjadi bentuk lingkaran.
// jika menggukanan
class DenganBoxdecoration extends StatelessWidget {
  const DenganBoxdecoration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(200 / 2),
        ),
        child: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
