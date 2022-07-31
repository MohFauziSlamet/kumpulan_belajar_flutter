import 'package:get/get.dart';

class CountController extends GetxController {
  int counter = 0;

  void add() {
    counter++;
    update();
  }

  void mines() {
    if (counter != 0) {
      counter--;
      update();
    }
  }
}
