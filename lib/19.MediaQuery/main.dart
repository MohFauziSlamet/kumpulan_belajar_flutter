import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Media Query"),
        ),
        body: mainPage(),
      ),
    );
  }
}

// ignore: camel_case_types
class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      // tinggi sepertiga dari layar
      height: MediaQuery.of(context).size.height / 3,
      // lebar setengah dari layar
      width: MediaQuery.of(context).size.width / 2,
    );
  }
}

// ignore: camel_case_types
class secondPage extends StatelessWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Column(
            children: generatedContainer,
          )
        : Row(
            children: generatedContainer,
          );
  }

  List<Widget> get generatedContainer {
    return [
      Container(
        color: Colors.red,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
    ];
  }
}
