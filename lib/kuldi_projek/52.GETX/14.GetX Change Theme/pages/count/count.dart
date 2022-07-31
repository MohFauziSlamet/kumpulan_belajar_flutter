import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/count_controller.dart';

class CountPage extends StatelessWidget {
  final countController = Get.find<CountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Count Page'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  '${countController.count}',
                  style: TextStyle(fontSize: 25),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    countController.mines();
                  },
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    countController.add();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ));
  }
}
