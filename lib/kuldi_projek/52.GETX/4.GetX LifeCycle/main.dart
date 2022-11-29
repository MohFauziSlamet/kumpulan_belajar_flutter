import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/other_page.dart';
import './controller/count_controller.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final counterControl = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management GETX OBX'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  counterControl.mines();
                },
                child: const Text('Dikurangi'),
              ),
              ElevatedButton(
                onPressed: () {
                  counterControl.add();
                },
                child: const Text('Ditambah'),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OtherPage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  CountWidget({
    Key? key,
  }) : super(key: key);
  final c = Get.find<CountController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CountController(),
      builder: (cntlr) => Text(
        'Angak ${c.counter}',
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
