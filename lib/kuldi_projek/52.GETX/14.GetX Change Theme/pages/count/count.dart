import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/count_controller.dart';

class CountPage extends StatelessWidget {
  final countController = Get.find<CountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Count Page'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  '${countController.count}',
                  style: const TextStyle(fontSize: 25),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    countController.mines();
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    countController.add();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ));
  }
}
