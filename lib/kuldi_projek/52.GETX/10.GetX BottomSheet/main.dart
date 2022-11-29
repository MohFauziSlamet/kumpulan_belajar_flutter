import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Dialog'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                color: Colors.lightBlue[50],
                child: Center(
                  child: ListView(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
