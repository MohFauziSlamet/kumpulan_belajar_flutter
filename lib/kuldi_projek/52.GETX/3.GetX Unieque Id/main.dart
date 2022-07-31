import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/count_controller.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final counter = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('State Management GETX OBX'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder(
              id: 'jono',
              init: counter,
              builder: (controller) => Text(
                'jono ${counter.counter}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder(
              id: "joni",
              init: counter,
              builder: (controller) => Text(
                'joni ${counter.counter}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder(
              init: counter,
              builder: (controller) => Text(
                'jontor ${counter.counter}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counter.mines();
                  },
                  child: Text('Dikurangi'),
                ),
                ElevatedButton(
                  onPressed: () {
                    counter.add();
                  },
                  child: Text('Ditambah'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
