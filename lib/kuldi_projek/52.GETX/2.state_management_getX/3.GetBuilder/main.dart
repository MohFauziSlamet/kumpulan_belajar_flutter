import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../3.GetBuilder/controller/count_controller.dart';

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
          title: const Text('State Management GETX OBX'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              init: counter,
              builder: (controller) => Text(
                'Angka ${counter.counter}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counter.mines();
                  },
                  child: const Text('Dikurangi'),
                ),
                ElevatedButton(
                  onPressed: () {
                    counter.add();
                  },
                  child: const Text('Ditambah'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
