import 'package:belajar_flutter/kuldi_projek/52.GETX/20.%20Tipe%20data%20GetX/controllers/main_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Type Data Rx"),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    "${controller.count}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.tambah();
                      },
                      child: const Text("+"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        controller.kurang();
                      },
                      child: const Text("-"),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    "${controller.dataString}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.updateDataString();
                      },
                      child: const Text("Update"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        controller.resetDataString();
                      },
                      child: const Text("Reset"),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    "${controller.dataDouble}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.tambahDataDouble();
                      },
                      child: const Text("+"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        controller.kurangDataDouble();
                      },
                      child: const Text("-"),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    "${controller.dataBoolean}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.gantiBoolean();
                  },
                  child: const Text("ganti boolean"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
// 085855645593