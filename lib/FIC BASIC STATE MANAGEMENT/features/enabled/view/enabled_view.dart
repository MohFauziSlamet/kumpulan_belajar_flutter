import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class EnabledView extends StatefulWidget {
  const EnabledView({Key? key}) : super(key: key);

  @override
  State<EnabledView> createState() => EnabledViewState();
}

class EnabledViewState extends State<EnabledView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enabled View"),
        centerTitle: true,
        actions: const [],
      ),
      body: const Center(
        child: Text("text"),
      ),
    );
  }
}
