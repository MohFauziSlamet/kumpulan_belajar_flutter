import '../controller/count_controller.dart';
import 'package:flutter/material.dart';

class CountView extends StatefulWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  State<CountView> createState() => CountViewState();
}

class CountViewState extends State<CountView> {
  @override
  Widget build(BuildContext context) {
    CountController c = CountController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count View"),
        centerTitle: true,
        actions: const [],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${c.counter}",
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {
                  c.add;
                  c.setState(() {});
                },
                label: const Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
