import 'dart:developer';

import 'package:belajar_flutter/FIC%20BASIC%20STATE%20MANAGEMENT/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    HomeController c = HomeController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Latihan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(thickness: 2),
            const SizedBox(height: 10.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemCount: 9,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      String data = c.routingOfLesson[index];
                      log('KLIK ${c.routingOfLesson[index]}');
                      c.routingLesson(lesson: data, context: context);
                      setState(() {});
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.pink[100],
                      child: Center(
                        child: Text(
                          "${c.nameOfLesson[index]}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
