// catatan
// memcari pengertian Container
// arti margin Padding
// properti all pada container

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latian Container'),
        ),
        body: Container(
          color: Colors.indigoAccent,
          // margin: EdgeInsets.fromLTRB(10, 20, 10, 20
          padding: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(10),
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.purple,
                        Colors.pinkAccent,
                      ])),
            ),
          ),
        ),
      ),
    );
  }
}
