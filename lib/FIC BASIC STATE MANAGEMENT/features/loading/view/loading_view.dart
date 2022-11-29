import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => LoadingViewState();
}

class LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading View"),
        centerTitle: true,
        actions: const [],
      ),
      body: const Center(
        child: Text("text"),
      ),
    );
  }
}
