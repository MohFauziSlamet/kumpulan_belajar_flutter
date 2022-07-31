import 'package:get/get.dart';

class CountController extends GetxController {
  int counter = 0;

  void add() {
    counter++;
    update(["jono", "joni"]);
  }

  void mines() {
    if (counter != 0) {
      counter--;
      update(["jono", "joni"]);
    }
  }
}
